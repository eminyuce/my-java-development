// AddEditContact.java
// Activity for adding a new entry to or  
// editing an existing entry in the address book.
package com.example.emin.activity;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;

import com.example.emin.R;
import com.example.emin.util.DatabaseConnector;

public class AddEditContact extends Activity 
{
   private long rowID; // id of contact being edited, if any
   
   // EditTexts for contact information
   private EditText nameEditText;
   private EditText phoneEditText;
   private EditText emailEditText;
   private EditText streetEditText;
   private EditText cityEditText;
   
   // called when the Activity is first started
   @Override
   public void onCreate(Bundle savedInstanceState) 
   {
      super.onCreate(savedInstanceState); // call super's onCreate
      setContentView(R.layout.add_contact); // inflate the UI

      nameEditText = (EditText) findViewById(R.id.nameEditText);
      emailEditText = (EditText) findViewById(R.id.emailEditText);
      phoneEditText = (EditText) findViewById(R.id.phoneEditText);
      streetEditText = (EditText) findViewById(R.id.streetEditText);
      cityEditText = (EditText) findViewById(R.id.cityEditText);
      
      Bundle extras = getIntent().getExtras(); // get Bundle of extras

      // if there are extras, use them to populate the EditTexts
      if (extras != null)
      {
         rowID = extras.getLong("row_id");
         nameEditText.setText(extras.getString("name"));  
         emailEditText.setText(extras.getString("email"));  
         phoneEditText.setText(extras.getString("phone"));  
         streetEditText.setText(extras.getString("street"));  
         cityEditText.setText(extras.getString("city"));  
      } // end if
      
      // set event listener for the Save Contact Button
      Button saveContactButton = 
         (Button) findViewById(R.id.saveContactButton);
      saveContactButton.setOnClickListener(saveContactButtonClicked);
   } // end method onCreate

   // responds to event generated when user clicks the Done Button
   OnClickListener saveContactButtonClicked = new OnClickListener() 
   {
      @Override
      public void onClick(View v) 
      {
         if (nameEditText.getText().length() != 0)
         {
            AsyncTask<Object, Object, Object> saveContactTask = 
               new AsyncTask<Object, Object, Object>() 
               {
                  @Override
                  protected Object doInBackground(Object... params) 
                  {
                     saveContact(); // save contact to the database
                     return null;
                  } // end method doInBackground
      
                  @Override
                  protected void onPostExecute(Object result) 
                  {
                     finish(); // return to the previous Activity
                  } // end method onPostExecute
               }; // end AsyncTask
               
            // save the contact to the database using a separate thread
            saveContactTask.execute((Object[]) null); 
         } // end if
         else
         {
            // create a new AlertDialog Builder
            AlertDialog.Builder builder = 
               new AlertDialog.Builder(AddEditContact.this);
      
            // set dialog title & message, and provide Button to dismiss
            builder.setTitle(R.string.errorTitle); 
            builder.setMessage(R.string.errorMessage);
            builder.setPositiveButton(R.string.errorButton, null); 
            builder.show(); // display the Dialog
         } // end else
      } // end method onClick
   }; // end OnClickListener saveContactButtonClicked

   // saves contact information to the database
   private void saveContact() 
   {
      // get DatabaseConnector to interact with the SQLite database
      DatabaseConnector databaseConnector = new DatabaseConnector(this);

      if (getIntent().getExtras() == null)
      {
         // insert the contact information into the database
         databaseConnector.insertContact(
            nameEditText.getText().toString(),
            emailEditText.getText().toString(), 
            phoneEditText.getText().toString(), 
            streetEditText.getText().toString(),
            cityEditText.getText().toString());
      } // end if
      else
      {
         databaseConnector.updateContact(rowID,
            nameEditText.getText().toString(),
            emailEditText.getText().toString(), 
            phoneEditText.getText().toString(), 
            streetEditText.getText().toString(),
            cityEditText.getText().toString());
      } // end else
   } // end class saveContact
} // end class AddEditContact


 
