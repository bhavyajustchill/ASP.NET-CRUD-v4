<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body bgcolor="#333333">
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td colspan="3" align="center">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Georgia" 
                        Font-Size="X-Large" ForeColor="White" Height="40px" Text="Admin Control Panel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="Button1" runat="server" BackColor="#A55129" Font-Bold="True" 
                        Font-Names="Georgia" Font-Size="Medium" ForeColor="White" Height="50px" 
                        Text="Dashboard" Width="300px" onmouseover="this.style.cursor='pointer'" />
                </td>
                <td align="center">
                    <asp:Button ID="Button2" runat="server" BackColor="#A55129" Font-Bold="True" 
                        Font-Names="Georgia" Font-Size="Medium" ForeColor="White" Height="50px" 
                        Text="Categories" Width="300px" onmouseover="this.style.cursor='pointer'" 
                        onclick="Button2_Click" />
                </td>
                <td align="center">
                    <asp:Button ID="Button3" runat="server" BackColor="#A55129" Font-Bold="True" 
                        Font-Names="Georgia" Font-Size="Medium" ForeColor="White" Height="50px" 
                        Text="Products" Width="300px" onmouseover="this.style.cursor='pointer'" 
                        onclick="Button3_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
