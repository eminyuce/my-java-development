<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="Infragistics4.Web.v12.1, Version=12.1.20121.1005, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" language="javascript">
        function WebDataGrid1_Sorting_Initialize(webdatagrid, eventArgs) {
            console.log("WebDataGrid1_Sorting_Initialize ");

        }
        function WebDataGrid1_Sorting_ColumnSorted(webdatagrid, eventArgs) {
            console.log("WebDataGrid1_Sorting_ColumnSorted ");

        }
        var lastSortDirection = 1;
        function WebDataGrid1_Sorting_ColumnSorting(webdatagrid, eventArgs) {

            //the sort direction needs to be modified based on the last sort on the link column.
            if (lastSortDirection == 1) {
                eventArgs.set_sortDirection(2);
                lastSortDirection = eventArgs.get_sortDirection();
            } else {
                eventArgs.set_sortDirection(1);
                lastSortDirection = eventArgs.get_sortDirection();
            }

            var column = eventArgs.get_column();
            var sortingBehavior = webdatagrid.get_behaviors().get_sorting();
            sortingBehavior.sortColumn(column, lastSortDirection, false);
            console.log("WebDataGrid1_Sorting_ColumnSorting " + lastSortDirection + " Key =" + column.get_key());



        }
        function Sort(mode) {
            var grid = $find("MainContent_WebDataGrid1");
            var column = grid.get_columns().get_column(0);
            var sortingBehavior = grid.get_behaviors().get_sorting();
            sortingBehavior.sortColumn(column, mode, false);
        }
        $(document).ready(function () {
            $('#Button2').click(function () {
                console.log("111");
                $('#MainContent_Button1').click();
            });

        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    <input id="Button2" type="button" value="Asc" />
    <input id="Button3" type="button" value="Desc" />
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Width="300" AutoGenerateColumns="False" DataKeyFields="Id"
        EnableAjax="False" DataSourceID="ObjectDataSource1">
        <Columns>
            
            <ig:BoundDataField DataFieldName="Id" Key="Id">
                <Header Text="Id" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Firstname" Key="Firstname">
                <Header Text="Firstname" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Lastname" Key="Lastname">
                <Header Text="Lastname" />
            </ig:BoundDataField>
        </Columns>
        <Behaviors>
            <ig:EditingCore BatchUpdating="true">
                <Behaviors>
                    <ig:RowAdding Alignment="Top" EditModeActions-EnableF2="false" EditModeActions-EnableOnKeyPress="true"
                                                                    EditModeActions-EnableOnActive="true" EditModeActions-MouseClick="Single" Enabled="true">
                    </ig:RowAdding>
                    <ig:RowDeleting />
                    <ig:CellEditing>
                    </ig:CellEditing>
                </Behaviors>
            </ig:EditingCore>
            <ig:Selection CellClickAction="Row" RowSelectType="Single">
            </ig:Selection>
            <ig:RowSelectors>
            </ig:RowSelectors>
        </Behaviors>
    </ig:WebDataGrid>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="selectPersons" TypeName="ObjectDataSourceMethods" DataObjectTypeName="Person"
        DeleteMethod="deletePersons" InsertMethod="addPersons" UpdateMethod="updatePersons">
    </asp:ObjectDataSource>
    <br />
</asp:Content>
