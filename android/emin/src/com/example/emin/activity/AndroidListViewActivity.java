package com.example.emin.activity;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;

import com.example.emin.R;
 
public class AndroidListViewActivity extends Activity {
	
	public static final String TAG = "AndroidListViewActivity";
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.list_item);
        
        try {
        	   
            // storing string resources into Array
            String[] adobe_products = getResources().getStringArray(R.array.adobe_products);
     
            //ListView myList=(ListView)findViewById(android.R.id.list);

       
            // Binding resources Array to ListAdapter
            //myList.setAdapter(new ArrayAdapter<String>(this, R.layout.list_item, R.id.label, adobe_products));
     
            
		} catch (Exception e) {
			Log.wtf(TAG, "Intent throws exception", e);
		} 
     
    }
}