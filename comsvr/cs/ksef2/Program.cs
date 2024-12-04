using System;
using LibGovPL;

namespace ksef2
{
    class Program
    {
        static void Main(string[] args)
        {
            // Tworzenie obiektu zaplecza
            lgcBackend backend = new lgcBackend();

            // Napisz wersje biblioteki
            Console.WriteLine("Wersja biblioteki: {0}", backend.GetLibVersion());

            // Tworzenie obiektu podpisu certyfikatem kwalifikowanym lub pieczecia
            lgcCertificateSigner certSigner = backend.CreateCertificateSigner("");

            // Wybierz certyfikat przez systemowe okienko wyboru certyfikatu
            lgcCertificate cert = certSigner.UISelect();

            if (cert != null)
            {
                // Napisz info o certyfikacie
                Console.WriteLine("Wybrano certyfikat: {0}", cert.DisplayName);

                // Tworzymy obiekt obslugi podpisu XAdES
                lgcXAdES xades = backend.CreateXAdES();
                // Ustawiamy obiekt obslugi podpisu certyfikatem
                xades.Signer = certSigner;

                // Tworzenie obiektu komunikacji KSeF
                IlgcKSeF_2_6_0 ksef = backend.CreateKSeF();

                // Tworzenie obiektu klienta HTTP
                ksef.HTTPClient = backend.CreateHTTPClient("");
                // Tworzenie klucza RSA ze wskazanego pliku bo uzyjemy dodatkowego szyfrowania AES
                ksef.RSAKeyDemo = backend.CreateRSAKey("", "ksefdemo.pem");


                // Ustawiamy obiekt sygnatury XAdES
                ksef.XAdES = xades;
                // Uzywamy wybranego certyfikatu
                ksef.Certificate = cert;

                // Ustawiamy parametry polaczenia
                ksef.Nip = "1111111111";
                ksef.GateType = lgcKSeFGateType.lgcKTGDemo; // Rodzaj serwera KSeF: 0 - produkcja, 1 - demo, 2 - test
                ksef.Encryption = true; // Wlacz dodatkowe szyfrowanie dokumentow algorytmem AES
                ksef.FormCode = 1; // Wersja struktury wysylanych plikow FA: 0 - FA(1), 1 - FA(2)

                // Czyscimy informacje o ostatnim bledzie
                backend.ClearLastError();
                bool aborted = false;
                dynamic response = null;
                try
                {
                    // Nawiazywanie sesji interaktywnej wybranym certyfikatem
                    response = ksef.SessionInitSigned();
                }
                catch (Exception e)
                {
                    // Sprawdz, czy anulowano wprowadzanie PIN
                    if (backend.LastError != null & backend.LastError.ExceptionClass == "EAbort")
                    {
                        Console.WriteLine("Anulowano wprowadzanie PIN");
                    }
                    else
                    {
                        Console.WriteLine("Blad: {0}", e.Message);
                        if (backend.LastError != null)
                        {
                            Console.WriteLine("backend.LastError:\n   komunikat: {0}\n   klasa wyjatku: {1}",
                                backend.LastError.Message, backend.LastError.ExceptionClass);
                        }
                    }
                    aborted = true;
                }

                if (!aborted & response != null)
                {
                    // Napisz token sesji
                    Console.WriteLine("Token sesji: {0}", response.SessionToken.Token);
                    // Napisz odpowiedz w postaci surowego JSON
                    Console.WriteLine("Surowa odpowiedz JSON: {0}", response.GetRawResponse());

                    // Odczekaj pare sekund po nawiazaniu sesji bo inaczej serwer odrzuci zadanie
                    Console.WriteLine("Momencik...");
                    System.Threading.Thread.Sleep(10000);

                    // Tworzenie obiektu kryteriow zapytania
                    dynamic criteria = ksef.CreateKSeFObject("TKSeFQueryCriteriaInvoiceDetail");
                    // Wyszukaj faktury sprzedazowe (gdzie w fa wystepujamy jako "Podmiot1")
                    criteria.SubjectType = 0; // 0 - subject1, 1 - subject2, 2 - subject3, ...
                    // Okres wystawienia wysukiwanych faktur
                    criteria.InvoicingDateFrom = DateTime.Now.AddDays(-30);
                    criteria.InvoicingDateTo = DateTime.Now;
                    // Tylko wystawione w walucie PLN i EUR
                    criteria.CurrencyCodesStr = "PLN,EUR";

                    // Tworzymy obiekt zapytania o faktury
                    dynamic request = ksef.CreateKSeFObject("TKSeFQueryInvoiceRequest");
                    // Ustawiamy obiekt kryteriow
                    request.QueryCriteria = criteria;
                    Console.WriteLine("Surowe zadanie: {0}", request.GetAsJSON());

                    // Zapytaj o faktury synchronicznie (10 na stronie, offset 0)
                    response = ksef.QueryInvoiceSync(request, 10, 0);
                    Console.WriteLine("Surowa odpowiedz: {0}", response.GetRawResponse());
                    Console.WriteLine("Ilosc faktur: {0}", response.InvoiceHeaderList.Count());

                    foreach (dynamic el in response.InvoiceHeaderList)
                    {
                        // Wypisz numery znalezionych faktur
                        Console.WriteLine("Nr fa: {0}, Nr KSeF: {1}", el.InvoiceReferenceNumber,
                            el.KsefReferenceNumber);
                    }

                    // Zamykanie sesji KSeF
                    ksef.SessionTerminate(false);
                }
            }
        }
    }
}
