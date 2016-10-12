using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using System.Net;
using System.Data.SqlTypes;
using System.IO;
using System.Xml;

namespace Apress.Samples
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void PopulateSearchTree()
        {
            Sql2008.AdvWorksProductBrowser ws = new Sql2008.AdvWorksProductBrowser();
            ws.Credentials = CredentialCache.DefaultCredentials;

            DataSet ds = ws.GetProductHierarchy();
            string CategoryName = "";
            string SubcategoryName = "";
            string ProductName = "";
            TreeNode CategoryNode = new TreeNode();
            TreeNode SubcategoryNode = new TreeNode();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                CategoryName = dr["ProductCategoryName"].ToString();
                SubcategoryName = dr["ProductSubcategoryName"].ToString();
                ProductName = dr["ProductName"].ToString();
                if (CategoryName != CategoryNode.Text)
                {
                    CategoryNode = new TreeNode();
                    CategoryNode.Text = CategoryName;
                    treeView1.Nodes.Add(CategoryNode);
                }
                if (SubcategoryName != SubcategoryNode.Text)
                {
                    SubcategoryNode = new TreeNode();
                    SubcategoryNode.Text = SubcategoryName;
                    CategoryNode.Nodes.Add(SubcategoryNode);
                }
                TreeNode ProductNode = new TreeNode();
                ProductNode.Text = ProductName;
                ProductNode.Tag = (int)dr["ProductID"];
                SubcategoryNode.Nodes.Add(ProductNode);
            }
        }

        private Image GetProductImage(int ProductID)
        {
            Sql2008.AdvWorksProductBrowser ws = new Sql2008.AdvWorksProductBrowser();
            ws.Credentials = CredentialCache.DefaultCredentials;
            SqlBinary photo = ws.GetProductPhoto(new SqlInt32(ProductID), SqlBoolean.False);
            MemoryStream ms = new MemoryStream(photo.Value);
            return Image.FromStream(ms);
        }

        private string GetHtmlProductDescription(int ProductID)
        {
            Sql2008.AdvWorksProductBrowser ws = new Sql2008.AdvWorksProductBrowser();
            ws.Credentials = CredentialCache.DefaultCredentials;
            Sql2008.xml html = ws.GetHtmlCatalogDescription(new SqlInt32(ProductID));
            string html_string = "<html><body><b>No Description</b></body></html>";
            if (html != null)
                html_string = html.Any[0].OuterXml;
            return html_string;
        }

        private void treeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {
            if (e.Node != null && e.Node.Tag != null)
            {
                pictureBox1.Image = GetProductImage((int)e.Node.Tag);
                webBrowser1.DocumentText = GetHtmlProductDescription((int)e.Node.Tag);
            }
            else
            {
                pictureBox1.Image = null;
                webBrowser1.DocumentText = null;
            }
        }
        
        private void Form1_Load(object sender, EventArgs e)
        {
            PopulateSearchTree();
        }
    }
}