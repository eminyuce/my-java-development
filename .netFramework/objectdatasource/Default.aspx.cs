using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Infragistics.Web.UI.GridControls;
using log4net;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Text;
using System.Xml;
using System.IO;


public partial class _Default : BasePage
{
    private static ILog log = LogManager.GetLogger(typeof(_Default));
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

       // Make all database operation in here.


    }

 

}
 