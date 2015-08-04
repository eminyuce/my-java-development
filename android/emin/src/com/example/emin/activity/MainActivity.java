package com.example.emin.activity;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

import com.androidquery.AQuery;
import com.example.emin.R;
import com.example.emin.asynctask.MyNetworkTask;
import com.example.emin.service.DownloadService;
import com.example.emin.util.AlertDialogManager;
import com.example.emin.util.ConnectionDetector;
import com.example.fragment.TabsFragment;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;

public class MainActivity extends BaseActivity {

	public static final String TAG = "EminApp";
	private ConnectionDetector cd;
	private AlertDialogManager alert = new AlertDialogManager();
	private RadioGroup radioSexGroup;
	private RadioButton radioSexButton; 
	private Button buttonMainScreen, buttonWebView, btnXmlListButton,
	btnJsonListButton,buttonTab,buttonSearch,buttonAddressBook;
	private MyNetworkTask mMyNetworkTask = null;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		//mMyNetworkTask = new MyNetworkTask(this);
		
	   
	    
		AQuery aQuery = getaQuery();  
		aQuery.id(R.id.buttonAddressButton).clicked(this, "buttonClicked");
		aQuery.id(R.id.buttonFragmentTab).clicked(this, "buttonClicked_FragmentTab");
		
		
		aQuery.id(R.id.btnSendMail).clicked(this, "buttonClicked_btnSendMail");
		
		
		cd = new ConnectionDetector(getApplicationContext());

		// Check if Internet present
		if (!cd.isConnectingToInternet()) {
			// Internet Connection is not present
			alert.showAlertDialog(MainActivity.this,
					"Internet Connection Error",
					"Please connect to working Internet connection", false);
			// stop executing code by return
			return;
		}

		

		final CheckBox checkBox = (CheckBox) this.findViewById(R.id.checkBox1);
		checkBox.setChecked(true);
		
	 
		aQuery.id(R.id.btnXmlListButton).clicked(this, "buttonClicked1");
		   
		
		buttonTab = (Button) this.findViewById(R.id.buttonTab);
		buttonTab.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				try {
					
				 
					Intent intent = new Intent(MainActivity.this, AndroidTabAndListView.class);
					startActivity(intent);
					 
				} catch (Exception e) {
					Log.wtf(TAG, "Intent throws exception", e);
				} 
			}
		});
		buttonMainScreen = (Button) this.findViewById(R.id.buttonMainScreen);
		buttonMainScreen.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				try {
					Intent intent = new Intent(MainActivity.this, MyAndroidAppActivity.class);
					 startActivity(intent);
				} catch (Exception e) {
					Log.wtf(TAG, "Intent throws exception", e);
				} 
			}
		});
		
		buttonWebView = (Button) this.findViewById(R.id.buttonWebView);
		buttonWebView.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				try {
					Intent intent = new Intent(MainActivity.this, WebViewActivity.class);
					 startActivity(intent);
				} catch (Exception e) {
					Log.wtf(TAG, "Intent throws exception", e);
				} 
			}
		});
		buttonSearch = (Button) this.findViewById(R.id.buttonSearch);
		buttonSearch.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				try {
					Intent intent = new Intent(MainActivity.this, ListViewSearchActivity.class);
					 startActivity(intent);
				} catch (Exception e) {
					Log.wtf(TAG, "Intent throws exception", e);
				} 
			}
		});
		final Button button = (Button) this.findViewById(R.id.buttonImage);
		final EditText text = (EditText) this.findViewById(R.id.editText1);
		final RadioButton radioButtonControls = (RadioButton) this.findViewById(R.id.radioButton1);
		radioSexGroup = (RadioGroup) findViewById(R.id.radioGroup1);
		 
		
		button.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				text.setText("Button is Clicked ALOOOOOOOOOOOo");
				checkBox.setChecked(false);
				  
		        // get selected radio button from radioGroup
				int selectedId = radioSexGroup.getCheckedRadioButtonId();
	 
				// find the radiobutton by returned id
			        radioSexButton = (RadioButton) findViewById(selectedId);
	 
				Toast.makeText(MainActivity.this,
					radioSexButton.getText(), Toast.LENGTH_SHORT).show();
				
				Intent intent = new Intent(MainActivity.this, DownloadActivity.class);
				  // add infos for the service which file to download and where to store
			    intent.putExtra(DownloadService.FILENAME, "index.html");
			    intent.putExtra(DownloadService.URL,
			        "http://www.vogella.com/index.html");
			    startActivity(intent);
			    
			}
		});
		
		checkBox.setOnCheckedChangeListener(new OnCheckedChangeListener() {
	            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
	                Log.d(TAG, "mShowInvisibleControl changed: " + isChecked);
	            	checkBox.setChecked(isChecked);
	            	
	            	text.setText("Checkbox is Checked!");
	            }
	        });
	}
	public void buttonClicked_btnSendMail(View view){
		Intent intent = new Intent(MainActivity.this, SendEmailActivity.class);
    	startActivity(intent);
	}
	public void buttonClicked(View view){
		Intent intent = new Intent(MainActivity.this, AddressBook.class);
    	startActivity(intent);
	}
	public void buttonClicked1(View view){
		Intent intent = new Intent(MainActivity.this, CustomizedListView.class);
		startActivity(intent);
	}
	public void buttonClicked_FragmentTab(View view){
		Intent intent = new Intent(MainActivity.this, TabsFragment.class);
		startActivity(intent);
	}
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.activity_main, menu);


		

		
		return true;
	}



}