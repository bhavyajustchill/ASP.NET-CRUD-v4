<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
    </style>
</head>
<body bgcolor="#333333">
    <form id="form1" runat="server">
    <div>
    
        <table style="width:50%;" align="center" border="0" cellpadding="5" 
            cellspacing="0" frame="border">
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="Label1" runat="server" BorderColor="#A55129" 
                        BorderStyle="Dashed" Font-Bold="True" Font-Names="Georgia" Font-Size="X-Large" 
                        Font-Underline="False" ForeColor="#A55129" Text="Category Details" 
                        Width="280px" Height="33px"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td align="right" bgcolor="#A55129" class="style1">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="White" 
                        Text="Category Name:"></asp:Label>
                </td>
                <td align="left" bgcolor="#A55129" class="style1">
                    <asp:TextBox ID="TextBox1" runat="server" Width="375px" 
                        ValidationGroup="insertData"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" Display="Dynamic" 
                        ErrorMessage="Category Name Required" ForeColor="Red" 
                        ValidationGroup="insertData">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#A55129" colspan="2">
                    <asp:Button ID="Button1" runat="server" BackColor="#00CC00" Font-Bold="True" 
                        Font-Names="Georgia" Font-Size="Large" ForeColor="White" 
                        Text="Add Category" onmouseover="this.style.cursor='pointer'" 
                        Width="297px" Height="37px" onclick="Button1_Click" 
                        ValidationGroup="insertData" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" BackColor="#CC0000" Font-Bold="True" 
                        Font-Names="Georgia" Font-Size="Large" ForeColor="White" Text="Reset Form" 
                        onmouseover="this.style.cursor='pointer'" 
                        Width="297px" Height="37px" onclick="Button2_Click" />
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#333333" colspan="2" 
                    style="color: #FFFFFF; font-weight: bold">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#CC0000" 
                        ForeColor="White" ValidationGroup="insertData" />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#A55129" colspan="2">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Georgia" 
                        Font-Size="X-Large" Font-Underline="True" ForeColor="White" 
                        Text="Categories List"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="padding: 0px">
                    <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" 
                        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        CellSpacing="2" AutoGenerateColumns="False" Width="820px">
                        <Columns>
                            <asp:TemplateField HeaderText="Category ID">
                                <ItemTemplate>
                                    <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("category_id") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category Name">
                                <ItemTemplate>
                                    <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("category_name") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Update">
                                <ItemTemplate>
                                    <asp:Button ID="Button3" runat="server" BackColor="#00CC00" 
                                        CommandArgument='<%# Eval("category_id") %>' Font-Bold="True" 
                                        Font-Names="Georgia" Font-Size="Large" ForeColor="White" Text="Update" 
                                        onmouseover="this.style.cursor='pointer'" Height="37px" onclick="Button3_Click" 
                                        Width="140px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:Button ID="Button4" runat="server" BackColor="#CC0000" 
                                        CommandArgument='<%# Eval("category_id") %>' Font-Bold="True" 
                                        Font-Names="Georgia" Font-Size="Large" ForeColor="White" Text="Delete" 
                                        onmouseover="this.style.cursor='pointer'" Height="37px" onclick="Button4_Click" 
                                        Width="122px" />
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
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="padding: 10px 0px 20px 0px">
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
