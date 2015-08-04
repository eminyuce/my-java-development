// AddressBook.java
// Main activity for the Address Book app.
package com.example.emin.activity;

import android.app.ListActivity;
import android.content.Intent;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.CursorAdapter;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;

import com.example.emin.R;
import com.example.emin.util.DatabaseConnector;

public class AddressBook extends ListActivity 
{
   public static final String ROW_ID = "row_id"; // Intent extra key
   private ListView contactListView; // the ListActivity's ListView
   private CursorAdapter contactAdapter; // adapter for ListView
   
   // called when the activity is first created
   @Override
   public void onCreate(Bundle savedInstanceState) 
   {
      super.onCreate(savedInstanceState); // call super's onCreate
      contactListView = getListView(); // get the built-in ListView
      contactListView.setOnItemClickListener(viewContactListener);      

      // map each contact's name to a TextView in the ListView layout
      String[] from = new String[] { "name" };
      int[] to = new int[] { R.id.contactTextView };
      contactAdapter = new SimpleCursorAdapter(
         AddressBook.this, R.layout.contact_list_item, null, from, to);
      setListAdapter(contactAdapter); // set contactView's adapter
   } // end method onCreate

   @Override
   protected void onResume() 
   {
      super.onResume(); // call super's onResume method
      
       // create new GetContactsTask and execute it 
       new GetContactsTask().execute((Object[]) null);
    } // end method onResume

   @Override
   protected void onStop() 
   {
      Cursor cursor = contactAdapter.getCursor(); // get current Cursor
      
      if (cursor != null) 
         cursor.deactivate(); // deactivate it
      
      contactAdapter.changeCursor(null); // adapted now has no Cursor
      super.onStop();
   } // end method onStop

   // To use AsyncTask you must subclass it. AsyncTask uses generics and varargs. 
   // The parameters are the following AsyncTask <TypeOfVarArgParams , ProgressValue , ResultValue>
   // performs database query outside GUI thread
   private class GetContactsTask extends AsyncTask<Object, Object, Cursor> 
   {
      DatabaseConnector databaseConnector = 
         new DatabaseConnector(AddressBook.this);

      // perform the database access
      @Override
      protected Cursor doInBackground(Object... params)
      {
         databaseConnector.open();

         // get a cursor containing call contacts
         return databaseConnector.getAllContacts(); 
      } // end method doInBackground

      // use the Cursor returned from the doInBackground method
      @Override
      protected void onPostExecute(Cursor result)
      {
         contactAdapter.changeCursor(result); // set the adapter's Cursor
         databaseConnector.close();
      } // end method onPostExecute
   } // end class GetContactsTask
      
   // create the Activity's menu from a menu resource XML file
   @Override
   public boolean onCreateOptionsMenu(Menu menu) 
   {
      super.onCreateOptionsMenu(menu);
      MenuInflater inflater = getMenuInflater();
      inflater.inflate(R.menu.addressbook_menu, menu);
      return true;
   } // end method onCreateOptionsMenu
   
   // handle choice from options menu
   @Override
   public boolean onOptionsItemSelected(MenuItem item) 
   {
      // create a new Intent to launch the AddEditContact Activity
      Intent addNewContact = 
         new Intent(AddressBook.this, AddEditContact.class);
      startActivity(addNewContact); // start the AddEditContact Activity
      return super.onOptionsItemSelected(item); // call super's method
   } // end method onOptionsItemSelected

   // event listener that responds to the user touching a contact's name
   // in the ListView
   OnItemClickListener viewContactListener = new OnItemClickListener() 
   {
      @Override
      public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
         long arg3) 
      {
         // create an Intent to launch the ViewContact Activity
         Intent viewContact = 
            new Intent(AddressBook.this, ViewContact.class);
         
         // pass the selected contact's row ID as an extra with the Intent
         viewContact.putExtra(ROW_ID, arg3);
         startActivity(viewContact); // start the ViewContact Activity
      } // end method onItemClick
   }; // end viewContactListener
} // end class AddressBook

 
