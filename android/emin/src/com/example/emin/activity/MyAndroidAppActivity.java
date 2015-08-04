package com.example.emin.activity;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.ImageView;
import android.widget.TextView;

import com.androidquery.AQuery;
import com.example.emin.R;
 

public class MyAndroidAppActivity extends BaseActivity {

	private TextView tvDisplayDate;
	private DatePicker dpResult;
	private Button btnChangeDate;
	private ImageDownloader imageDownloader = null;
	private AQuery aq = null;
	
	private int year;
	private int month;
	private int day;
 
	static final int DATE_DIALOG_ID = 999;
 
	
	public static final String TAG = "EminApp";
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		imageDownloader = new ImageDownloader();
		aq = getaQuery();
		aq.id(R.id.buttonImage).clicked(this, "buttonClicked_Image");
		
		try {
			StringBuffer buf = new StringBuffer();

		    buf.append("VERSION.RELEASE {"+Build.VERSION.RELEASE+"}");
		    buf.append("\\nVERSION.INCREMENTAL {"+Build.VERSION.INCREMENTAL+"}");
		    buf.append("\\nVERSION.SDK {"+Build.VERSION.SDK_INT+"}");
		    buf.append("\\nBOARD {"+Build.BOARD+"}");
		    buf.append("\\nBRAND {"+Build.BRAND+"}");
		    buf.append("\\nDEVICE {"+Build.DEVICE+"}");
		    buf.append("\\nFINGERPRINT {"+Build.FINGERPRINT+"}");
		    buf.append("\\nHOST {"+Build.HOST+"}");
		    buf.append("\\nID {"+Build.ID+"}");

		    Log.d("build",buf.toString()); 
		    
			setCurrentDateOnView();
			addListenerOnButton();
		} catch (Exception e) {
			// TODO: handle exception
			Log.wtf(TAG, " exception", e);
		}
		
		
	}
	

	// display current date
	public void setCurrentDateOnView() {
 
		tvDisplayDate = (TextView) findViewById(R.id.tvDate);
		dpResult = (DatePicker) findViewById(R.id.dpResult);
 
		final Calendar c = Calendar.getInstance();
		year = c.get(Calendar.YEAR);
		month = c.get(Calendar.MONTH);
		day = c.get(Calendar.DAY_OF_MONTH);
 
		// set current date into textview
		tvDisplayDate.setText(new StringBuilder()
			// Month is 0 based, just add 1
			.append(month + 1).append("-").append(day).append("-")
			.append(year).append(" "));
 
		// set current date into datepicker
		dpResult.init(year, month, day, null);
 
	}
 
	public void addListenerOnButton() {
 
		btnChangeDate = (Button) findViewById(R.id.btnChangeDate);
 
		btnChangeDate.setOnClickListener(new OnClickListener() {
 
			@Override
			public void onClick(View v) {
 
				showDialog(DATE_DIALOG_ID);
 
			}
 
		});
 
	}
 
	@Override
	protected Dialog onCreateDialog(int id) {
		switch (id) {
		case DATE_DIALOG_ID:
		   // set date picker as current date
		   return new DatePickerDialog(this, datePickerListener, 
                         year, month,day);
		}
		return null;
	}
 
	private DatePickerDialog.OnDateSetListener datePickerListener 
                = new DatePickerDialog.OnDateSetListener() {
 
		// when dialog box is closed, below method will be called.
		public void onDateSet(DatePicker view, int selectedYear,
				int selectedMonth, int selectedDay) {
			year = selectedYear;
			month = selectedMonth;
			day = selectedDay;
 
			// set selected date into textview
			tvDisplayDate.setText(new StringBuilder().append(month + 1)
			   .append("-").append(day).append("-").append(year)
			   .append(" "));
 
			// set selected date into datepicker also
			dpResult.init(year, month, day, null);
 
		}
	};
	public void buttonClicked_Image(View view){
		imageDownloader.execute("http://wanderingoak.net/bridge.png"); 
	}

private class ImageDownloader extends AsyncTask<String, Integer, Bitmap>{
	
	protected void onPreExecute(){
        //Setup is done here
    }
    protected Bitmap doInBackground(String... params) {
        //TODO Auto-generated method stub
        try{
            URL url = new URL(params[0]);
            HttpURLConnection httpCon = 
            (HttpURLConnection)url.openConnection();
            if(httpCon.getResponseCode() != 200)
                throw new Exception("Failed to connect");
            InputStream is = httpCon.getInputStream();
            return BitmapFactory.decodeStream(is);
            
        }catch(Exception e){
            Log.e("Image","Failed to load image",e);
        }
        return null;
    } 
    protected void onProgressUpdate(Integer... params){
        //Update a progress bar here, or ignore it, it's up to you
    }
    protected void onPostExecute(Bitmap img){
        ImageView iv = (ImageView)findViewById(R.id.remote_image);
        if(iv!=null && img!=null){
            iv.setImageBitmap(img);
        }
    }
        protected void onCancelled(){
        }
    }
}
