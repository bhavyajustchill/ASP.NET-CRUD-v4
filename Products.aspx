<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body bgcolor="#333333">
    <form id="form1" runat="server">
    <div>
    
        <table align="center" cellspacing="0" style="width: 50%;">
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="Label1" runat="server" BorderColor="#A55129" 
                        BorderStyle="Dashed" Font-Bold="True" Font-Names="Georgia" Font-Size="X-Large" 
                        Font-Underline="False" ForeColor="#A55129" Text="Product Details" 
                        Width="280px" Height="33px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#A55129" 
                    style="padding: 5px; color: #FFFFFF; font-weight: bold;">
                    Product Name:&nbsp;&nbsp;
                </td>
                <td bgcolor="#A55129">
                    <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="insertData"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Product Name Required" 
                        ForeColor="#CC0000" ValidationGroup="insertData" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#A55129" 
                    style="padding: 5px; color: #FFFFFF; font-weight: bold;">
                    Product Category:&nbsp;&nbsp;
                </td>
                <td bgcolor="#A55129">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        ValidationGroup="insertData" Height="24px" Width="145px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DropDownList1" ErrorMessage="Please select a Category" 
                        ForeColor="#CC0000" InitialValue="0" ValidationGroup="insertData" 
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#A55129" 
                    style="padding: 5px; color: #FFFFFF; font-weight: bold;">
                    Product Price:&nbsp;&nbsp;
                </td>
                <td bgcolor="#A55129">
                    <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="insertData"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Enter Price in Numbers only" 
                        ForeColor="#CC0000" ValidationExpression="^[\d]*$" 
                        ValidationGroup="insertData" Display="Dynamic">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Please Enter the Price" 
                        ForeColor="#CC0000" ValidationGroup="insertData" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#A55129" colspan="2" 
                    style="padding: 15px 0px 10px 0px">
                    <asp:Button ID="Button1" runat="server" BackColor="#00CC00" Font-Bold="True" 
                        Font-Names="Georgia" Font-Size="Large" ForeColor="White" Text="Add Product" 
                        Width="176px" onmouseover="this.style.cursor='pointer'" 
                        onclick="Button1_Click" ValidationGroup="insertData" Height="32px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" BackColor="#CC0000" Font-Bold="True" 
                        Font-Names="Georgia" Font-Size="Large" ForeColor="White" Text="Reset Form" 
                        Width="175px" onmouseover="this.style.cursor='pointer'" 
                        onclick="Button2_Click" Height="31px" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" 
                    style="padding: 10px; color: #FFFFFF; font-weight: bold;">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        BackColor="#CC0000" ValidationGroup="insertData" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" 
                    style="padding: 5px; color: #FFFFFF; font-weight: bold;" bgcolor="#A55129">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Georgia" 
                        Font-Size="XX-Large" Font-Underline="True" Text="Product Details"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" CellSpacing="2" Width="820px">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("product_id") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("product_name") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("category_name") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("product_price") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Update">
                                <ItemTemplate>
                                    <asp:Button ID="Button3" runat="server" BackColor="#00CC00" Font-Bold="True" 
                                        ForeColor="White" Height="34px" Text="Update" Width="126px" 
                                        Font-Names="Georgia" Font-Size="Large" 
                                        onmouseover="this.style.cursor='pointer'" 
                                        CommandArgument='<%# Eval("product_id") %>' onclick="Button3_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:Button ID="Button4" runat="server" BackColor="#CC0000" Font-Bold="True" 
                                        Font-Names="Georgia" Font-Size="Large" ForeColor="White" Height="35px" 
                                        Text="Delete" Width="127px" onclick="Button4_Click" 
                                        onmouseover="this.style.cursor='pointer'" 
                                        CommandArgument='<%# Eval("product_id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" HorizontalAlign="Center" 
                            VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                    <br />
                    <asp:Button ID="Button5" runat="server" BackColor="#FFFF66" Font-Bold="True" 
                        Font-Names="Georgia" Font-Size="Large" Height="39px" 
                        Text="Go Back to Dashboard" Width="820px" 
                        onmouseover="this.style.cursor='pointer'" onclick="Button5_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
