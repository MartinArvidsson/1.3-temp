<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KonverteraTemperaturer.Default" ViewStateMode="Disabled"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/Style/Style.css" />
</head>
<body>
    <form id="form1" runat="server">
    
    <div id="MainWindowArea">
    <h1>Konvertera temperatur</h1>
    <h2>Starttemperatur:</h2>
        
        <%-- Formulär --%>
        <%-- 1:a textboxen --%>
        <div id="AllignTextBox1">
        <asp:TextBox ID="StartTempBox" CssClass="Textbox" runat="server"></asp:TextBox><br />
        
            <asp:RequiredFieldValidator ID="NoEmptyStartTemp" 
            runat="server" 
            ErrorMessage="Fältet kan inte vara tomt"
            ControlToValidate="StartTempBox" 
            Display="Dynamic" CssClass="ErrorMessage">
            </asp:RequiredFieldValidator>
        <asp:CompareValidator ID="ValidationOfStartTemp" 
            runat="server" 
            ErrorMessage="Ange ett tal!" 
            Display="Dynamic" Type="Integer"  
            ControlToValidate="StartTempBox" 
            Operator="DataTypeCheck" 
            CssClass="ErrorMessage">

        </asp:CompareValidator>
        </div>

<%-- 2:dra textboxen --%>
    <h2>Sluttemperatur:</h2>
        <div id="AllignTextBox2">
            <asp:TextBox ID="EndTempTextBox" CssClass="Textbox" runat="server"></asp:TextBox><br />        
            <asp:RequiredFieldValidator ID="NoEmptyEndTemp" 
                runat="server" ErrorMessage="Fältet kan inte vara tomt" 
                ControlToValidate="EndTempTextBox" 
                Display="Dynamic" 
                CssClass="ErrorMessage">

            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="ValidationOfEndTemp" 
                runat="server" 
                ErrorMessage="Ange ett tal!" 
                Display="Dynamic" Type="Integer"  
                ControlToValidate="EndTempTextBox" 
                Operator="DataTypeCheck" 
                CssClass="ErrorMessage">

            </asp:CompareValidator>
            <asp:CompareValidator ID="ValidationGreaterThanStart" 
                runat="server" 
                ErrorMessage="Sluttemp måste vara större än Starttemperaturen." 
                Type="Integer" 
                Display="Dynamic" 
                ControlToValidate="EndTempTextBox" 
                Operator="GreaterThan"
                ControlToCompare="StartTempBox" 
                CssClass="ErrorMessage">

            </asp:CompareValidator>
        </div>
    <%-- 3:dje textboxen --%>
    <h2>Temperatursteg värde mellan 1-100:</h2>
        
        <div id="AllignTextBox3">
            <asp:TextBox ID="TempStepBox" CssClass="Textbox" runat="server"></asp:TextBox><br />        
            <asp:RequiredFieldValidator ID="NoEmptyTempStep" 
                runat="server" 
                ErrorMessage="Fältet kan inte vara tomt" 
                ControlToValidate="TempStepBox" 
                Display="Dynamic" 
                CssClass="ErrorMessage">

            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="ValidationOfTempStep" 
                runat="server" 
                ErrorMessage="Ange ett tal!" 
                Display="Dynamic" 
                Type="Integer"  
                ControlToValidate="TempStepBox" 
                ValueToCompare="0" 
                Operator="GreaterThan" 
                CssClass="ErrorMessage">

            </asp:CompareValidator>
            <asp:RangeValidator ID="ValidationOfRangeTempStep" 
                runat="server" 
                ErrorMessage="Måste vara inom intervallet 1-100" 
                Display="Dynamic" 
                ControlToValidate="TempStepBox" 
                MaximumValue="100" 
                MinimumValue="1" 
                Type="Integer" 
                CssClass="ErrorMessage">

            </asp:RangeValidator>
        </div>


    <h2>Typ av konvertering:</h2>
            <div id="ChooseButton">    
                <asp:RadioButton ID="CelToFarButton"
                    CssClass="RadioButton" 
                    runat="server" 
                    Text="Celsius till farenheit" 
                    GroupName="KonvertButton" 
                    Checked="True" /><br />

                <asp:RadioButton ID="FarToCelButton" runat="server"
                    CssClass="RadioButton" 
                    Text="Farenheit till celsius" 
                    GroupName="KonvertButton" />
                <br />

                <asp:Button ID="CalculateButton"
                     CssClass="CalcButton"
                     runat="server"
                     Text="Konvertera!"
                     OnClick="CalculateButton_Click" />
            </div>
        </div>
    
    </form>
    <asp:Table ID="Table1" runat="server" Visible="False">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell ID="Left">&deg;C</asp:TableHeaderCell>
            <asp:TableHeaderCell ID="Right">&deg;F</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
</body>
</html>
