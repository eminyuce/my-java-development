using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

/// <summary>
/// Summary description for ObjectDataSourceMethods
/// </summary>
/// 
[DataObject(true)]
public class ObjectDataSourceMethods
{
    List<Person> newPersonList = new List<Person>();


    public ObjectDataSourceMethods()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<Person> selectPersons()
    {
        if (HttpContext.Current.Session["newPersonList"] == null)
        {
            newPersonList = new List<Person>();
            HttpContext.Current.Session["newPersonList"] = newPersonList;
        }

        return (List<Person>)HttpContext.Current.Session["newPersonList"];
        //var list = new List<Person>();
        //for (int i = 0; i < 10; i++)
        //{
        //    list.Add(new Person(i, "name " + i, " last name " + i));
        //}
        //return list;
    }
    [DataObjectMethod(DataObjectMethodType.Insert)]
    public void addPersons(Person p)
    {
        if (HttpContext.Current.Session["newPersonList"] == null)
        {
            newPersonList = new List<Person>();
        }

        newPersonList = (List<Person>)HttpContext.Current.Session["newPersonList"];
        Person a = p;
        newPersonList.Add(p);
        HttpContext.Current.Session["newPersonList"] = newPersonList;
    }
    [DataObjectMethod(DataObjectMethodType.Delete)]
    public void deletePersons(Person p)
    {
        newPersonList = (List<Person>)HttpContext.Current.Session["newPersonList"];
        Person a = p;
        Person deletedPerson = newPersonList.Find(r => r.Id == p.Id);
        newPersonList.Remove(deletedPerson);
        HttpContext.Current.Session["newPersonList"] = newPersonList;
    }
    [DataObjectMethod(DataObjectMethodType.Update)]
    public void updatePersons(Person p)
    {
        newPersonList = (List<Person>)HttpContext.Current.Session["newPersonList"];
        Person a = p;
        Person deletedPerson = newPersonList.Find(r => r.Id == p.Id);
        newPersonList.Remove(deletedPerson);
        newPersonList.Add(p);
        HttpContext.Current.Session["newPersonList"] = newPersonList;
    }
}