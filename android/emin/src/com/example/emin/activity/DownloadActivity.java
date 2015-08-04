package com.example.emin.activity;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.example.emin.R;
import com.example.emin.service.DownloadService;


public class DownloadActivity  extends Activity {

	public static final String TAG = "DownloadActivityApp";
  private TextView textView;
  private BroadcastReceiver receiver = new BroadcastReceiver() {

	  @Override
	    public void onReceive(Context context, Intent intent) {
	      Bundle bundle = intent.getExtras();
	      if (bundle != null) {
	        String string = bundle.getString(DownloadService.FILEPATH);
	        int resultCode = bundle.getInt(DownloadService.RESULT);
	        if (resultCode == RESULT_OK) {
	          Toast.makeText(DownloadActivity.this,
	              "Download complete. Download URI: " + string,
	              Toast.LENGTH_LONG).show();
	          textView.setText("Download done.Download URI: " + string);
	        } else {
	          Toast.makeText(DownloadActivity.this, "Download failed",
	              Toast.LENGTH_LONG).show();
	          textView.setText("Download failed");
	        }
	      }
	    }
  };

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.download);
    textView = (TextView) findViewById(R.id.status);
    

  }

  @Override
  protected void onResume() {
    super.onResume();
    registerReceiver(receiver, new IntentFilter(DownloadService.NOTIFICATION));
  }
  @Override
  protected void onPause() {
    super.onPause();
    unregisterReceiver(receiver);
  }

  public void onClick(View view) {

	  try {
		  
		  Intent intent = new Intent(this, DownloadService.class);
		    // add infos for the service which file to download and where to store
		    intent.putExtra(DownloadService.FILENAME, "index.html");
		    intent.putExtra(DownloadService.URL,
		        "http://www.vogella.com/index.html");
		    startService(intent);

		    Log.d(TAG, " Download service is begun..");
		    textView.setText("Service started");
		
	} catch (Exception e) {
		// TODO: handle exception
		 textView.setText("Download service exception is occured.");
		  Log.e(TAG, "Download service exception is occured.");
	}
    
    
    
   
  }
} 