using System;
using LibGovPL;

namespace ksef1
{
    class Program
    {
        static void Main(string[] args)
        {
            // Tworzenie obiektu zaplecza
            lgcBackend backend = new lgcBackend();

            // Napisz wersje biblioteki
            Console.WriteLine("Wersja biblioteki: {0}", backend.GetLibVersion());

            // Tworzenie obiektu komunikacji KSeF
            IlgcKSeF_2_6_0 ksef = backend.CreateKSeF();

            try
            {
                // Tworzenie obiektu klienta HTTP
                ksef.HTTPClient = backend.CreateHTTPClient("");

                // Tworzenie klucza RSA ze wskazanego pliku
                ksef.RSAKeyTest = backend.CreateRSAKey("", "kseftest.pem");

                // Ustawiamy parametry polaczenia
                ksef.Nip = "1111111111";
                ksef.Token = "1111111111222222222233333333333344444444444445555555555555666666";
                ksef.GateType = lgcKSeFGateType.lgcKTGTest; // Rodzaj serwera KSeF: 0 - produkcja, 1 - demo, 2 - test
                ksef.FormCode = 1; // Wersja struktury wysylanych plikow FA: 0 - FA(1), 1 - FA(2)

                // Nawiazywanie sesji interaktywnej tokenem
                dynamic response = ksef.SessionInitToken();

                // Napisz token sesji
                Console.WriteLine("Token sesji: {0}", response.SessionToken.Token);
                // Napisz odpowiedz w postaci surowego JSON
                Console.WriteLine("Surowa odpowiedz JSON: {0}", response.GetRawResponse());

                // Odczekaj pare sekund po nawiazaniu sesji bo inaczej serwer odrzuci zadanie
                Console.WriteLine("Momencik...");
                System.Threading.Thread.Sleep(10000);

                // Pobierz fakture i zapisz do pliku
                ksef.InvoiceGet("1111111111-20241120-333333333333-QQ", "fa.xml");
                Console.WriteLine("Pobrano fakture");
            }
            catch (Exception e)
            {
                Console.WriteLine("Blad: {0}", e.Message);
                if (backend.LastError != null)
                {
                    Console.WriteLine("backend.LastError:\n   komunikat: {0}\n   klasa wyjatku: {1}", 
                        backend.LastError.Message, backend.LastError.ExceptionClass);
                }                
            }

            // Konczenie sesji KSeF
            if (ksef.SessionActive)
            {
                ksef.SessionTerminate(false);
            }
        }
    }
}
