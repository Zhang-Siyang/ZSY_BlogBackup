---
title: '[Homework]对 SQL 数据库的四则操作'
date: 2017-06-19 03:16:47
tags:
---

Dataworker.cs

```CS
namespace Database_Demo
{
    class Dataworker
    {
        /* 原来打算把对库的操作都集成进来，甚至一个参数串
         * 就能搞定，想想这项目也太小，罢了
         */
    }
}
```

---
DBInfo.cs

```CS
namespace Database_Demo
{
    class DBInfo
    {
        public static string constr = "Data Source=L014\\MYSQL;" +
            "Initial Catalog=DEMO;Integrated Security=True";
        private static string State_Yes;

        public static string State_Yes1
        {
            get { return "已连接"; }
        }

        private static string State_No;

        public static string State_No1
        {
            get { return "未连接"; }
        }
    }
}
```

---
Get_or_Put.cs

```CS
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Database_Demo
{
    public partial class Get_or_Put : Form
    {
        public static String constr = @"Data Source=DESKTOP-8KK88IQ\SQL_EXPRESS_471G;" +
                    @"Initial Catalog=DEMO;Integrated Security=True";
        public static SqlConnection con_471G = new SqlConnection(constr);
        public static string getall_sql = "SELECT * FROM Info";
        public static SqlDataAdapter da = new SqlDataAdapter(getall_sql, con_471G);
        SqlCommandBuilder duider = new SqlCommandBuilder(da);
        DataSet ds = new DataSet();

        bool online = false;

        public Get_or_Put()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            timer1.Interval = 100;
            timer1.Enabled = true;

            da.Fill(ds, "DEMO_Info");
        }

        private void SELECT_Click(object sender, EventArgs e)
        {
            if (online)
            {
                textBox2.Clear();
                string com = string.Format("SELECT PASSWD FROM INFO WHERE ID='{0}'",
                    textBox1.Text.Trim());
                SqlCommand comm = new SqlCommand(com, con_471G);
                if (comm.ExecuteScalar().ToString() == string.Empty)    //TODO
                    textBox2.Text = "查无此人";
                else
                    textBox2.Text = comm.ExecuteScalar().ToString();
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (row[0].ToString() == textBox1.Text.Trim())
                    {
                        textBox2.Text = row[1].ToString();
                    }
                }
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

            if (checkBox1.CheckState == CheckState.Unchecked)
            {
                if (con_471G.State == ConnectionState.Closed)
                {
                    con_471G.Open();
                    da.Update(ds, "DEMO_Info");
                    ds.Clear();
                }
                online = true;
            }
            else
            {
                if (con_471G.State == ConnectionState.Open)
                {
                    con_471G.Close();
                }
                da.Fill(ds, "DEMO_Info");
                online = false;
            }
        }


        private void button2_Click(object sender, EventArgs e)
        {
            if (online)
            {
                string com = string.Format("DELETE FROM Info WHERE ID = '{0}'",
                    textBox1.Text.Trim());
                SqlCommand comm = new SqlCommand(com, con_471G);
                if (comm.ExecuteNonQuery() == 1)
                {
                    MessageBox.Show("成功！ ID 为：" + textBox1.Text.Trim(), "删除结果");
                }
                else
                {
                    MessageBox.Show("失败了， ID 为：" + textBox1.Text.Trim()
                        + " Code: " + comm.ExecuteNonQuery().ToString(), "删除结果");
                }
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (row[0].ToString() == textBox1.Text.Trim())
                    {
                        try
                        {
                            row.Delete();
                            MessageBox.Show("删除成功", "离线删除");
                        }
                        catch
                        {
                            MessageBox.Show("删除失败", "离线删除");
                        }

                    }
                }
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (con_471G.State == ConnectionState.Open)
                label3.Text = DBInfo.State_Yes1;
            else
                label3.Text = DBInfo.State_No1;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (online)
            {
                string com = string.Format("INSERT INTO Info values('{0}','{1}')",
                    textBox1.Text.Trim(), textBox2.Text.Trim());
                SqlCommand comm = new SqlCommand(com, con_471G);
                if (comm.ExecuteNonQuery() == 1)
                {
                    MessageBox.Show("成功！ ID 为：" + textBox1.Text.Trim() +
                        " 密码为：" + textBox2.Text.Trim(), "插入结果");
                }
                else
                {
                    MessageBox.Show("失败了， ID 为：" + textBox1.Text.Trim()
                        + " Code: " + comm.ExecuteNonQuery().ToString(), "插入结果");
                }
            }
            else
            {
                DataRow dr = ds.Tables["DEMO_Info"].NewRow();
                dr[0] = textBox1.Text.Trim();
                dr[1] = textBox2.Text.Trim();
                ds.Tables["DEMO_Info"].Rows.Add(dr);
                MessageBox.Show("成功！ ID 为：" + textBox1.Text.Trim() +
                        " 密码为：" + textBox2.Text.Trim(), "插入结果");
            }
        }

        private void Update_Click(object sender, EventArgs e)
        {
            if (online)
            {
                string com = string.Format("UPDATE Info SET PASSWD = '{0}' " +
                    "WHERE ID = '{1}'", textBox2.Text.Trim(), textBox1.Text.Trim());
                SqlCommand comm = new SqlCommand(com, con_471G);
                if (comm.ExecuteNonQuery() == 1)
                {
                    MessageBox.Show("成功！ ID 为：" + textBox1.Text.Trim() +
                        " 密码为：" + textBox2.Text.Trim(), "插入结果");
                }
                else
                {
                    MessageBox.Show("失败了， ID 为：" + textBox1.Text.Trim()
                        + " Code: " + comm.ExecuteNonQuery().ToString(), "插入结果");
                }
            }
            else
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (row[0].ToString() == textBox1.Text.Trim())
                    {
                        try
                        {
                            row[1] = textBox2.Text.Trim();
                            MessageBox.Show("修改成功", "离线修改");
                        }
                        catch
                        {
                            MessageBox.Show("修改失败", "离线修改");
                        }

                    }
                }
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            //本来是想手动同步数据库的，后来的版本中取消了，留作纪念罢了
        }
    }
}
```

---
Program.cs

```CS
using System;
using System.Windows.Forms;

namespace Database_Demo
{
    static class Program
    {
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Verify());
        }
    }
}
```

---
UserInfo.cs
```CS
namespace Database_Demo
{
    class UserInfo
    {
        private static string id;
        private static string passwd;

        public static string Id { get => id; set => id = value; }
        public static string Passwd { get => passwd; set => passwd = value; }
    }
}
```

---
Verify.cs
```CS
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Database_Demo
{
    public partial class Verify : Form
    {
        public Verify()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            UserInfo.Id = textBox1.Text.Trim();
            UserInfo.Passwd = textBox2.Text.Trim();
            if (UserInfo.Id == "")
            {
                MessageBox.Show("用户名为空");
                textBox1.Focus();
            }
            else if (UserInfo.Passwd == "")
            {
                MessageBox.Show("密码为空");
                textBox2.Focus();
            }
            else
            {
                String constr = @"Data Source=DESKTOP-8KK88IQ\SQL_EXPRESS_471G;" +
                    @"Initial Catalog=DEMO;Integrated Security=True";
                SqlConnection con_471G = new SqlConnection(constr);

                con_471G.Open();

                String sql = String.Format("select count(*) from Info where " +
                    "ID='{0}' and PASSWD = '{1}' ", UserInfo.Id,
                    UserInfo.Passwd);
                SqlCommand cmd = new SqlCommand(sql, con_471G);
                int n = (int)cmd.ExecuteScalar();

                con_471G.Close();

                if (n == 1)
                {
                    Get_or_Put demo = new Get_or_Put();
                    demo.Show();
                }
                else if (n > 1)
                    MessageBox.Show("数据库出现异常，请立即联系数据库管理员！" +
                        "\nError Code: A1", "特殊异常");
                else
                    MessageBox.Show("登录失败,用户名错误或密码异常");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
```
