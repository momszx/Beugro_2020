using System;
using System.Collections.Generic;
using System.IO;
using MySql.Data.MySqlClient;

namespace Feladat_2
{
    internal class Program
    {
        static Random rnd = new Random();
        static List<int> szamok= new List<int>();
        static List<kulcsok> kulcsok =new List<kulcsok>();
        static List<Irando> irandok =new List<Irando>();
        static string readPath = "olvass.txt";
        static string writePath = "iras.txt";
        private static string dataBaseCon = @"server=localhost;userid=root;password=mysql;database=cs_beugro";
        public static void Main(string[] args)
        {
            szamgeneraras();
            fileOlvasas();
            List<float> user_id_list =kereses();
            adatbazisKapcsolat();
            fileIras();
            Console.ReadKey();
        }

        public static void fileOlvasas()
        {
            try
            {
                using (StreamReader sr = new StreamReader(readPath))
                {
                    string fejlec = sr.ReadLine();
                    string line;
                    while ((line=sr.ReadLine())!=null)
                    {
                        string[] lines;
                        lines = line.Split('|');
                        kulcsok kulcs=new kulcsok();
                        try
                        {
                            kulcs.values = (float)Convert.ToDouble(lines[1]);
                            kulcs.key = Convert.ToInt32(lines[0]);
                        }
                        catch (Exception e)
                        {
                        }
                        kulcsok.Add(kulcs);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("File beolvasási hiba. Ellenőrizd hogy létezik e az olvass.txt");
                Console.WriteLine(e);
                throw;
            }
        }
        public static List<float> kereses()
        {
            List<float> keresett =new List<float>();
            for (int i = 0; i < kulcsok.Count; i++)
            {
                for (int j = 0; j < szamok.Count; j++)
                {
                    if ((kulcsok[i].key == szamok[j])&&(kulcsok[i].values >=0)&&(kulcsok[i].values%1==0))
                    {
                        keresett.Add(kulcsok[i].values);
                    }
                }
            }
            return keresett;
        }
        public static void szamgeneraras()
        {
            bool nincs = true;
            if (szamok.Count<10)
            {
                int genSzam = rnd.Next(1, 51);
                if (szamok.Count>0)
                {
                    for (int i = 0; i < szamok.Count; i++)
                    {
                        if (szamok[i]==genSzam) nincs = false;
                    }
                }
                if (nincs) szamok.Add(genSzam);
                szamgeneraras();
            }
        }
        public static void adatbazisKapcsolat()
        {
            try
            {
                var con = new MySqlConnection(dataBaseCon);
                con.Open();
                Console.WriteLine($"MySQL version : {con.ServerVersion}");
                using (var  cmd=new MySqlCommand("SELECT user.name,car.brand,car.model FROM user INNER JOIN user_car ON user.id=user_car.user INNER JOIN car ON user_car.car=car.id",con))
                {
                    using (var reader= cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var name = reader.GetString(0);
                            var brand = reader.GetString(1);
                            var model = reader.GetString(2);
                            Console.WriteLine(name+" "+brand+" "+model);
                            Irando irando =new Irando();
                            irando.name = name;
                            irando.brand = brand;
                            irando.model = model;
                            irandok.Add(irando);
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        private static void fileIras()
        {
            using (var sw=new StreamWriter(writePath))
            {
                sw.WriteLine("Tulajdonosa -> Márka -> Model");
                for (int i = 0; i < irandok.Count; i++)
                {
                    sw.WriteLine(irandok[i].name+" -> "+irandok[i].brand+" -> "+irandok[i].model);
                }
            }
            Console.WriteLine("File irás sikeresen befejeződöt");
        }
    }
}