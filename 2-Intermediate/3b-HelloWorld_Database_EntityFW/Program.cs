using System;
using System.Data;
using Dapper;
using HelloWorld.Data;
using HelloWorld.Models;
using Microsoft.Data.SqlClient;

namespace HelloWorld
{
    internal class Program
    {
        static void Main(string[] args)
        {
            DataContextEF entityFramework = new DataContextEF();

            //----------------------------------------------------------------------------

            Computer myComputer = new Computer()
            {
                Motherboard = "Z690",
                HasWifi = true,
                HasLTE = false,
                ReleaseDate = DateTime.Now,
                Price = 943.87m,
                VideoCard = "RTX 2060"
            };

            entityFramework.Add(myComputer);
            entityFramework.SaveChanges();
            //----------------------------------------------------------------------------



            IEnumerable<Computer>? computers = entityFramework.Computer?.ToList<Computer>(); 

            if (computers != null)
            {
                Console.WriteLine("'ComputerId','Motherboard','CPUCores','HasWifi','HasLTE','ReleaseDate'"
                + ",'Price','VideoCard'");
                foreach (Computer singleComputer in computers)
                {
                    Console.WriteLine("'" + singleComputer.ComputerId
                        + "','" + singleComputer.Motherboard
                        + "','" + singleComputer.CPUCores
                        + "','" + singleComputer.HasWifi
                        + "','" + singleComputer.HasLTE
                        + "','" + singleComputer.ReleaseDate
                        + "','" + singleComputer.Price
                        + "','" + singleComputer.VideoCard
                        + "'");
                }
            }
            //----------------------------------------------------------------------------







        }

    }
}