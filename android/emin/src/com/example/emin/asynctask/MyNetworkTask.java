package com.example.emin.asynctask;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.util.EntityUtils;

import android.app.ProgressDialog;
import android.content.Context;
import android.net.ParseException;
import android.os.AsyncTask;
import android.util.Log;

public class MyNetworkTask extends AsyncTask<String, Void, HttpResponse> { // <doInBackground, onProgressUpdate, onPostExecute>
	public static final String TAG = "MyNetworkTask";
    private ProgressDialog dialog;
    private Context context;

    public MyNetworkTask(Context ctx) {
        context = ctx;
        dialog = new ProgressDialog(context);
    }

    @Override
    protected void onPreExecute() {
        dialog.setMessage("Working ...");
        dialog.show();
    }
    @Override
    protected HttpResponse doInBackground(final String... params) {
        String mURL = params[0];
        HttpParams httpparams = new BasicHttpParams();
        HttpProtocolParams.setContentCharset(httpparams, "UTF-8");

        HttpClient httpclient = new DefaultHttpClient(httpparams);
        HttpPost httppost = new HttpPost(mURL);
        httppost.setHeader("User-Agent", "MyUserAgent/1.0");

        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
        nameValuePairs.add(new BasicNameValuePair("param1", "value1"));
        nameValuePairs.add(new BasicNameValuePair("param2", "value2"));
        try {
            httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs));
            return httpclient.execute(httppost);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
    @Override
    protected void onPostExecute(final HttpResponse result) {
        if (dialog.isShowing()) {
            dialog.dismiss();
        }
        if (result != null) {
            int responseCode = result.getStatusLine().getStatusCode();
            String responseBody="";
            switch(responseCode) {
            case 200:
                HttpEntity entity = result.getEntity();
                if(entity != null) {
                    try {
                        responseBody = EntityUtils.toString(entity);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                break;
            }
            Log.v(TAG, "Response Code => " + responseCode);
            Log.i(TAG, "Response Body => " + responseBody);
        }
    }

    @Override
    protected void onCancelled() {
        if (dialog.isShowing()) {
            dialog.dismiss();
        }
    }
} // AsyncTask
