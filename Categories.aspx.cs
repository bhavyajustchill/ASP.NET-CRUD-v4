using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Categories : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        printData();
        //SelectCommand="SELECT [category_id], [category_name] FROM [categories]" 
        //UpdateCommand="UPDATE [categories] SET [category_name] = @category_name WHERE [category_id] = @category_id"
        //DeleteCommand="DELETE FROM [categories] WHERE [category_id] = @category_id" 
        //InsertCommand="INSERT INTO [categories] ([category_name]) VALUES (@category_name)"
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text.Equals("Add Category") && Page.IsValid)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [categories] ([category_name]) VALUES (@category_name)", con);
            cmd.Parameters.AddWithValue("@category_name", TextBox1.Text);

            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();

            if (s == 1)
            {
                Literal1.Text = "Category added successfully!";
            }
            else
            {
                Literal1.Text = "Error! There was a problem and category could not be added!";
            }
            resetForm();
            printData();
        }
        else if (Button1.Text.Equals("Update Category") && Page.IsValid)
        {
            SqlCommand cmd = new SqlCommand("UPDATE [categories] SET [category_name] = @category_name WHERE [category_id] = @category_id", con);
            cmd.Parameters.AddWithValue("@category_name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@category_id", ViewState["category_id"]);

            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();

            if (s == 1)
            {
                Literal1.Text = "Category Details Updated Successfully!";
            }
            else
            {
                Literal1.Text = "Error! Category Details could not be Updated!";
            }
            resetForm();
            printData();
        }
        else
        {
            Literal1.Text = "Unknown Error Occured!";
            resetForm();
        }
    }

    void printData()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [category_id], [category_name] FROM [categories]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    void resetForm()
    {
        TextBox1.Text = string.Empty;
        Button1.Text = "Add Category";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        resetForm();
        Literal1.Text = string.Empty;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button1.Text = "Update Category";
        Button btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [category_id], [category_name] FROM [categories] WHERE [category_id] = " + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        TextBox1.Text = dt.Rows[0][1].ToString();
        ViewState["category_id"] = btn.CommandArgument;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [categories] WHERE [category_id] = @category_id", con);
        cmd.Parameters.AddWithValue("@category_id", btn.CommandArgument);
        int s = 0;
        con.Open();
        try
        {
            s = cmd.ExecuteNonQuery();
        }
        catch (Exception)
        {
            Response.Write("<script language=javascript>alert ('You cannot delete this category as the system contains product of its type!'); </script>");
        }
        con.Close();
        if (s == 1)
        {
            Literal1.Text = "Data Deleted Successfully!";
        }
        else
        {
            Literal1.Text = "Error!";
        }
        printData();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}