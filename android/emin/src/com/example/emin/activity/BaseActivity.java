package com.example.emin.activity;

import com.androidquery.AQuery;

import android.app.Activity;

public abstract class BaseActivity extends Activity {
	private AQuery aQuery = new AQuery(this);
	
	public AQuery getaQuery() {
		return aQuery;
	}

	 
}
