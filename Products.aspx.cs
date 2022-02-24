using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Products : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        if (!IsPostBack)
        {
            printData();
            dropDownBind();
        }
        else
        {
            printData();
            DropDownList1.Items[0].Attributes["disabled"] = "disabled";

        }
        //SelectCommand="SELECT [product_id], [product_category_id], [product_name], [product_price] FROM [products]" 
        //UpdateCommand="UPDATE [products] SET [product_category_id] = @product_category_id, [product_name] = @product_name, [product_price] = @product_price WHERE [product_id] = @product_id
        //DeleteCommand="DELETE FROM [products] WHERE [product_id] = @product_id" 
        //InsertCommand="INSERT INTO [products] ([product_category_id], [product_name], [product_price]) VALUES (@product_category_id, @product_name, @product_price)" 
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text.Equals("Add Product"))
        {
            if (Page.IsValid)
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [products] ([product_category_id], [product_name], [product_price]) VALUES (@product_category_id, @product_name, @product_price)", con);
                cmd.Parameters.AddWithValue("@product_category_id", Convert.ToInt32(DropDownList1.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@product_name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@product_price", TextBox2.Text);

                con.Open();
                int s = cmd.ExecuteNonQuery();
                con.Close();

                if (s == 1)
                {
                    Literal1.Text = "Product added successfully!";
                }
                else
                {
                    Literal1.Text = "Error! Product could not be added!";
                }
                printData();
                resetForm();
            }
            else
            {
                Literal1.Text = "Invalid Details";
            }
        }
        else if (Button1.Text.Equals("Update Product"))
        {
            if (Page.IsValid)
            {
                SqlCommand cmd = new SqlCommand("UPDATE [products] SET [product_category_id] = @product_category_id, [product_name] = @product_name, [product_price] = @product_price WHERE [product_id] = @product_id", con);
                cmd.Parameters.AddWithValue("@product_category_id", Convert.ToInt32(DropDownList1.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@product_name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@product_price", TextBox2.Text);
                cmd.Parameters.AddWithValue("@product_id", ViewState["product_id"]);

                con.Open();
                int s = cmd.ExecuteNonQuery();
                con.Close();

                if (s == 1)
                {
                    Literal1.Text = "Product Details Updated Successfully!";
                }
                else
                {
                    Literal1.Text = "Error! The product details could not be updated!";
                }
                printData();
                resetForm();
            }
            else
            {
                Literal1.Text = "Invalid Details";
            }
        }
        else
        {
            Literal1.Text = "Unknown Error Occured!";
        }
    }

    void printData()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [product_id], [product_category_id], [product_name], [product_price], [category_id], [category_name] FROM [categories], [products] WHERE [product_category_id] = [category_id]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    void resetForm()
    {
        TextBox1.Text = string.Empty;
        DropDownList1.SelectedIndex = -1;
        TextBox2.Text = string.Empty;
        Button1.Text = "Add Product";
    }
    void dropDownBind()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [category_id], [category_name] FROM [categories]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        DropDownList1.DataSource = dt;
        DropDownList1.DataTextField = "category_name";
        DropDownList1.DataValueField = "category_id";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, new ListItem("Select a Category", "0"));
        DropDownList1.Items[0].Selected = true;
        DropDownList1.Items[0].Attributes["disabled"] = "disabled";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        resetForm();
        Literal1.Text = string.Empty;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [products] WHERE [product_id] = @product_id", con);
        cmd.Parameters.AddWithValue("@product_id", btn.CommandArgument);

        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();

        if (s == 1)
        {
            Literal1.Text = "Product Deleted Successfully!";
        }
        else
        {
            Literal1.Text = "Error! The Product could not be deleted!";
        }
        printData();
        resetForm();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button1.Text = "Update Product";
        Button btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [product_id], [product_category_id], [product_name], [product_price] FROM [products] WHERE [product_id] = " + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        TextBox1.Text = dt.Rows[0][2].ToString();
        DropDownList1.Text = dt.Rows[0][1].ToString();
        TextBox2.Text = dt.Rows[0][3].ToString();
        ViewState["product_id"] = btn.CommandArgument;
        DropDownList1.Items[0].Attributes["disabled"] = "disabled";
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}