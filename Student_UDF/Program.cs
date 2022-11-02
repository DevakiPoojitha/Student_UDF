
using System.Data.SqlClient;
namespace Student_UDF
{
    internal class Program
    {
        static void Main(string[] args)
        {
            try
            {
                string ConnectionStr = @"Data Source=INLPF1AVPDL;Initial Catalog=MyDb;trusted_connection=true";
                SqlConnection sqlconn = new SqlConnection(ConnectionStr);
                sqlconn.Open();
                SqlCommand sqcmd = new SqlCommand("proc_2", sqlconn);
                sqcmd.CommandType = System.Data.CommandType.StoredProcedure;

                Console.WriteLine("Enter the Name:");
                string name = Console.ReadLine();
                sqcmd.Parameters.Add("@students_names", System.Data.SqlDbType.VarChar).Value = name;
                SqlDataReader reader = sqcmd.ExecuteReader();

                while (reader.Read())
                {

                    Console.Write("\n" + reader[0] + "  ");
                    Console.Write(reader[1] + "  ");
                    Console.WriteLine();

                }
                reader.Close();

                Console.WriteLine("Code Running Successfully successfully");
                sqlconn.Close();

            }
            catch(SqlException sqlE)
            {
                Console.WriteLine(sqlE.Message);
                Console.WriteLine("SQL ERROR");
            }
            catch(Exception e)
            {

                Console.WriteLine(e.Message);
                Console.WriteLine("ERR");
            }


        }
    }
}