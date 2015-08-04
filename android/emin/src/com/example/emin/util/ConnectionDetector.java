package com.example.emin.util;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.util.Log;
 
public class ConnectionDetector {
 
	public static final String TAG = "ConnectionDetector";
    private Context _context;
 
    public ConnectionDetector(Context context){
        this._context = context;
    }
 
    /**
     * Checking for all possible internet providers
     * **/
    public boolean isConnectingToInternet(){
        ConnectivityManager connectivity = (ConnectivityManager) _context.getSystemService(Context.CONNECTIVITY_SERVICE);
          if (connectivity != null)
          {
        	 try {
				
              NetworkInfo[] info = connectivity.getAllNetworkInfo();
              if (info != null)
                  for (int i = 0; i < info.length; i++)
                      if (info[i].getState() == NetworkInfo.State.CONNECTED)
                      {
                          return true;
                      }

 			} catch (Exception e) {
 				Log.wtf(TAG, "isConnectingToInternet method throws exception.", e);
 				return false;
 			}		 
          
          }
          return false;
    }
}
