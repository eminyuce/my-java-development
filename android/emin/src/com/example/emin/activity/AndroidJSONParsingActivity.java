package com.example.emin.activity;



import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

import com.example.emin.NodeNames;
import com.example.emin.R;
import com.example.emin.util.JSONParser;
 
public class AndroidJSONParsingActivity extends ListActivity implements NodeNames {
 
    // url to make request
    private static String url = "http://api.androidhive.info/contacts/";
    private EditText inputSearch; 
    private SimpleAdapter adapter;
 
    // contacts JSONArray
    JSONArray contacts = null;
 
    @Override
    public void onCreate(Bundle savedInstanceState) {
    	
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        
        super.onCreate(savedInstanceState);
        setContentView(R.layout.jsonlist);
 
       
        // Hashmap for ListView
        ArrayList<HashMap<String, String>> contactList = new ArrayList<HashMap<String, String>>();
 
        // Creating JSON Parser instance
        JSONParser jParser = new JSONParser();
 
        // getting JSON string from URL
        JSONObject json = jParser.getJSONFromUrl(url);
 
        try {
            // Getting Array of Contacts
            contacts = json.getJSONArray(TAG_CONTACTS);
 
            // looping through All Contacts
            for(int i = 0; i < contacts.length(); i++){
                JSONObject c = contacts.getJSONObject(i);
 
                // Storing each json item in variable
                String id = c.getString(TAG_ID);
                String name = c.getString(TAG_NAME);
                String email = c.getString(TAG_EMAIL);
                String address = c.getString(TAG_ADDRESS);
                String gender = c.getString(TAG_GENDER);
 
                // Phone number is agin JSON Object
                JSONObject phone = c.getJSONObject(TAG_PHONE);
                String mobile = phone.getString(TAG_PHONE_MOBILE);
                String home = phone.getString(TAG_PHONE_HOME);
                String office = phone.getString(TAG_PHONE_OFFICE);
 
                // creating new HashMap
                HashMap<String, String> map = new HashMap<String, String>();
 
                // adding each child node to HashMap key => value
                map.put(TAG_ID, id);
                map.put(TAG_NAME, name);
                map.put(TAG_EMAIL, email);
                map.put(TAG_PHONE_MOBILE, mobile);
 
                // adding HashList to ArrayList
                contactList.add(map);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
 
        /**
         * Updating parsed JSON data into ListView
         * */
        adapter = new SimpleAdapter(this, contactList,
                R.layout.list_item,
                new String[] { TAG_NAME, TAG_EMAIL, TAG_PHONE_MOBILE }, new int[] {
                        R.id.name, R.id.email, R.id.mobile });
 
        setListAdapter(adapter);
 
        // selecting single ListView item
        ListView lv = getListView();
 
        // Launching new screen on Selecting Single ListItem
        lv.setOnItemClickListener(new OnItemClickListener() {
 
            @Override
            public void onItemClick(AdapterView<?> parent, View view,
                    int position, long id) {
                // getting values from selected ListItem
                String name = ((TextView) view.findViewById(R.id.name)).getText().toString();
                String cost = ((TextView) view.findViewById(R.id.email)).getText().toString();
                String description = ((TextView) view.findViewById(R.id.mobile)).getText().toString();
 
                // Starting new intent
                Intent in = new Intent(getApplicationContext(), SingleMenuItemActivity.class);
                in.putExtra(TAG_NAME, name);
                in.putExtra(TAG_EMAIL, cost);
                in.putExtra(TAG_PHONE_MOBILE, description);
                startActivity(in);
            }
        });
        
        
        inputSearch = (EditText) findViewById(R.id.inputJsonSearch);
        
        /**
         * Enabling Search Filter
         * */
        inputSearch.addTextChangedListener(new TextWatcher() {
			
			@Override
			public void onTextChanged(CharSequence cs, int arg1, int arg2, int arg3) {
				// When user changed the Text
				AndroidJSONParsingActivity.this.adapter.getFilter().filter(cs);	
			}
			
			@Override
			public void beforeTextChanged(CharSequence arg0, int arg1, int arg2,
					int arg3) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void afterTextChanged(Editable arg0) {
				// TODO Auto-generated method stub							
			}
		});
    
 
 
    }
 
}