using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;
using System;
using System.Diagnostics;
using IronPython.Hosting;
using Microsoft.Scripting.Hosting;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;




namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        bool create = false;
        string[] sorthot = new string[10];
        string[] hot = new string[10];
        string[] sortscore = new string[10];
        string[] score = new string[10];
        string[] mainhot_score = new string[10]; //以人氣度為主排名之後的各景點評分
        string[] mainscore_hot = new string[10]; //同上、相反

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadgridbyxml();
            }

            /*每天更新一次即可*/
            /*
            if (create == false)
            {
                ProcessStartInfo Info = new ProcessStartInfo();
                Info.FileName = "gogomain.bat";
                Info.WorkingDirectory = @"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2";
                Process.Start(Info);
                create = true;
            }*/

            StreamReader str4 = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\sort_hot.txt");
            for (int i = 0; i < 10; i++)
                sorthot[i] = str4.ReadLine();
            str4.Close();

            StreamReader str5 = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\hot.txt");
            for (int i = 0; i < 10; i++)
                hot[i] = str5.ReadLine();
            str5.Close();

            StreamReader str6 = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\sort_score.txt");
            for (int i = 0; i < 10; i++)
                sortscore[i] = str6.ReadLine();
            str6.Close();

            StreamReader str7 = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\score.txt");
            for (int i = 0; i < 10; i++)
                score[i] = str7.ReadLine();
            str7.Close();

            StreamReader str8 = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\mainhot_score.txt");
            for (int i = 0; i < 10; i++)
                mainhot_score[i] = str8.ReadLine();
            str8.Close();

            StreamReader str9 = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\mainscore_hot.txt");
            for (int i = 0; i < 10; i++)
                mainscore_hot[i] = str9.ReadLine();
            str9.Close();

            Label31.Text = sorthot[0];
            Label32.Text = sorthot[1];
            Label33.Text = sorthot[2];
            Label34.Text = sorthot[3];
            Label35.Text = sorthot[4];
            Label36.Text = sorthot[5];
            Label37.Text = sorthot[6];
            Label38.Text = sorthot[7];
            Label39.Text = sorthot[8];
            Label40.Text = sorthot[9];

            Label41.Text = hot[0];
            Label42.Text = hot[1];
            Label43.Text = hot[2];
            Label44.Text = hot[3];
            Label45.Text = hot[4];
            Label46.Text = hot[5];
            Label47.Text = hot[6];
            Label48.Text = hot[7];
            Label49.Text = hot[8];
            Label50.Text = hot[9];

            Label51.Text = sortscore[0];
            Label52.Text = sortscore[1];
            Label53.Text = sortscore[2];
            Label54.Text = sortscore[3];
            Label55.Text = sortscore[4];
            Label56.Text = sortscore[5];
            Label57.Text = sortscore[6];
            Label58.Text = sortscore[7];
            Label59.Text = sortscore[8];
            Label60.Text = sortscore[9];

            Label61.Text = score[0];
            Label62.Text = score[1];
            Label63.Text = score[2];
            Label64.Text = score[3];
            Label65.Text = score[4];
            Label66.Text = score[5];
            Label67.Text = score[6];
            Label68.Text = score[7];
            Label69.Text = score[8];
            Label70.Text = score[9];

            Label71.Text = mainhot_score[0];
            Label72.Text = mainhot_score[1];
            Label73.Text = mainhot_score[2];
            Label74.Text = mainhot_score[3];
            Label75.Text = mainhot_score[4];
            Label76.Text = mainhot_score[5];
            Label77.Text = mainhot_score[6];
            Label78.Text = mainhot_score[7];
            Label79.Text = mainhot_score[8];
            Label80.Text = mainhot_score[9];

            Label81.Text = mainscore_hot[0];
            Label82.Text = mainscore_hot[1];
            Label83.Text = mainscore_hot[2];
            Label84.Text = mainscore_hot[3];
            Label85.Text = mainscore_hot[4];
            Label86.Text = mainscore_hot[5];
            Label87.Text = mainscore_hot[6];
            Label88.Text = mainscore_hot[7];
            Label89.Text = mainscore_hot[8];
            Label90.Text = mainscore_hot[9];


        }

        
        private void loadgridbyxml()
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("hotsort.xml"));
            GridView1.DataSource = ds;
            GridView1.DataBind();
            

        }
        protected void Gridview_Rowcommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "getname")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView1.Rows[index];
                TableCell attractionName = selectedRow.Cells[1];
                string attraction = attractionName.Text;
                buttonsearch(attraction);
            }
        }



        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string searchname = TextBox1.Text;
            string bat = "cd /d C:\\Users\\hayoung\\Desktop\\commentproject\\commentproject\\WebApplication2\r\ncall activate project\r\ncall python main.py search() " + searchname + "\r\nREM pause\r\n";
            File.WriteAllText(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\test.bat", bat, Encoding.GetEncoding("big5"));
            ProcessStartInfo Info2 = new ProcessStartInfo();
            Info2.FileName = "test.bat";
            Info2.WorkingDirectory = @"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2";
            Process.Start(Info2);
            Thread.Sleep(4000);

            Label1.Text = searchname;
            StreamReader str = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\search_result.txt");
            string[] search_result = new string[5];
            for (int i = 0; i < 5; i++)
                search_result[i] = str.ReadLine();
            str.Close();
            Label_Toldescribe.Text = search_result[0];
            Label_ADD.Text = search_result[1];
            Label_Parking.Text = search_result[2];
            Label_Tel.Text = search_result[3];
            Label_Opentime.Text = search_result[4];

            StreamReader str2 = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\Weather.txt");
            string[] weather = new string[9];
            for (int i = 0; i < 9; i++)
                weather[i] = str2.ReadLine();
            str2.Close();
            Label_tem1.Text = weather[0];
            Label_tem2.Text = weather[3];
            Label_tem3.Text = weather[6];
            Label_comfort1.Text = weather[1];
            Label_comfort2.Text = weather[4];
            Label_comfort3.Text = weather[7];
            Label_rain1.Text = weather[2];
            Label_rain2.Text = weather[5];
            Label_rain3.Text = weather[8];

            StreamReader str3 = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\UVI.txt");
            Label_UVI.Text = str3.ReadLine();
            str3.Close();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DropDownList1.SelectedValue)
            {
                case "hot":
                    Panel1.Visible = true;
                    Panel2.Visible = false;
                    break;
                case "score":
                    Panel2.Visible = true;
                    Panel1.Visible = false;
                    break;

            }
        }

        protected void buttonsearch(string name)
        {
            string searchname = name;
            string bat = "cd /d C:\\Users\\hayoung\\Desktop\\commentproject\\commentproject\\WebApplication2\r\ncall activate project\r\ncall python main.py search() " + searchname + "\r\nREM pause\r\n";
            File.WriteAllText(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\test.bat", bat, Encoding.GetEncoding("big5"));
            ProcessStartInfo Info2 = new ProcessStartInfo();
            Info2.FileName = "test.bat";
            Info2.WorkingDirectory = @"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2";
            Process.Start(Info2);
            Thread.Sleep(4000);

            Label1.Text = searchname;
            StreamReader str = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\search_result.txt");
            string[] search_result = new string[5];
            for (int i = 0; i < 5; i++)
                search_result[i] = str.ReadLine();
            str.Close();
            Label_Toldescribe.Text = search_result[0];
            Label_ADD.Text = search_result[1];
            Label_Parking.Text = search_result[2];
            Label_Tel.Text = search_result[3];
            Label_Opentime.Text = search_result[4];

            StreamReader str2 = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\Weather.txt");
            string[] weather = new string[9];
            for (int i = 0; i < 9; i++)
                weather[i] = str2.ReadLine();
            str2.Close();
            Label_tem1.Text = weather[0];
            Label_tem2.Text = weather[3];
            Label_tem3.Text = weather[6];
            Label_comfort1.Text = weather[1];
            Label_comfort2.Text = weather[4];
            Label_comfort3.Text = weather[7];
            Label_rain1.Text = weather[2];
            Label_rain2.Text = weather[5];
            Label_rain3.Text = weather[8];

            StreamReader str3 = new StreamReader(@"C:\Users\hayoung\Desktop\commentproject\commentproject\WebApplication2\File\UVI.txt");
            Label_UVI.Text = str3.ReadLine();
            str3.Close();
        }
    }


}
