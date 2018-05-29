<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Webbshop.Public_Pages.Register" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Ny kund</h1>
    <div>

        <table cellpadding="4" class="auto-style2">
            <tr>
                <td class="auto-style8">Förnamn*</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox1" runat="server" Width="183px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Efternamn*</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox2" runat="server" Width="182px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">E-postadress*</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox3" runat="server" Width="182px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Adress*</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox4" runat="server" Width="182px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Postnr*</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox5" runat="server" Width="182px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Mobil*</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox6" runat="server" Width="182px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">Användarnamn*</td>
                <td class="auto-style15">
                    <asp:TextBox ID="TextBox9" runat="server" Width="182px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox9" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Lösenord*</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox7" TextMode="Password" runat="server" Width="182px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Bekräfta Lösenord*</td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBox8" TextMode="Password" runat="server" Width="182px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="* " ForeColor="Red" ControlToValidate="TextBox8"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox7" ControlToValidate="TextBox8" ErrorMessage="*Lösenord matchar ej" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style9">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Ja, jag accepterar VS's allmänna villkor och sekretesspolicy.*" />
                    <br />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="* Detta är ett obligatoriskt fält"  onservervalidate="CustomValidator1_ServerValidate" ForeColor="Red"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style7">
                    <asp:Button ID="Button1" runat="server" Text="Skapa Nytt" Width="129px" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style8"><span style="color: rgb(64, 64, 64); font-family: arial, helvetica, 'DejaVu Sans', 'Arial Unicode MS', 'Lucida Sans Unicode', sans-serif; font-size: 10px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: auto; text-align: right; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none;">* Obligatoriska fält</span></td>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>
                </td>
            </tr>
        </table>
        <table class="auto-style1">
        </table>

    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .auto-style1 {
        width: 33%;
        border-collapse: collapse;
        height: 29px;
    }
    .auto-style2 {
        width: 40%;
            margin-right: 0px;
        }
    .auto-style3 {
            width: 274px;
        }
    .auto-style4 {
        height: 37px;
        width: 130px;
    }
    .auto-style5 {
        width: 189px;
        height: 37px;
    }
    .auto-style6 {
        height: 53px;
        width: 130px;
    }
    .auto-style7 {
        width: 274px;
        height: 53px;
    }
    .auto-style8 {
        width: 130px;
    }
    .auto-style9 {
        width: 274px;
        height: 37px;
       
    }
    .auto-style10 {
        height: 52px;
        width: 130px;
    }
    .auto-style11 {
        width: 274px;
        height: 52px;
    }
        .auto-style14 {
            width: 130px;
            height: 25px;
        }
        .auto-style15 {
            width: 274px;
            height: 25px;
        }
        .auto-style16 {
            width: 130px;
            height: 24px;
        }
        .auto-style17 {
            width: 274px;
            height: 24px;
        }
    </style>
</asp:Content>


