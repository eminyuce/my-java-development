package com.example.emin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.emin.activity.CustomizedListView;
import com.example.emin.util.ImageLoader;

public class LazyAdapter extends BaseAdapter implements Filterable {

	private Activity activity;
	private ArrayList<HashMap<String, String>> data;
	private static LayoutInflater inflater = null;
	public ImageLoader imageLoader;
	private ArrayList<HashMap<String, String>> tempData;

	public LazyAdapter(Activity a, ArrayList<HashMap<String, String>> d) {
		activity = a;
		data = d;
		tempData = d;
		inflater = (LayoutInflater) activity
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		imageLoader = new ImageLoader(activity.getApplicationContext());
	}

	public int getCount() {
		return data.size();
	}

	public Object getItem(int position) {
		return position;
	}

	public long getItemId(int position) {
		return position;
	}

	public View getView(int position, View convertView, ViewGroup parent) {
		View vi = convertView;
		if (convertView == null)
			vi = inflater.inflate(R.layout.list_row, null);

		TextView title = (TextView) vi.findViewById(R.id.title); // title
		TextView artist = (TextView) vi.findViewById(R.id.artist); // artist
																	// name
		TextView duration = (TextView) vi.findViewById(R.id.duration); // duration
		ImageView thumb_image = (ImageView) vi.findViewById(R.id.list_image); // thumb
																				// image

		HashMap<String, String> song = new HashMap<String, String>();
		song = data.get(position);

		// Setting all values in listview
		title.setText(song.get(CustomizedListView.KEY_TITLE));
		artist.setText(song.get(CustomizedListView.KEY_ARTIST));
		duration.setText(song.get(CustomizedListView.KEY_DURATION));
		imageLoader.DisplayImage(song.get(CustomizedListView.KEY_THUMB_URL),
				thumb_image);
		return vi;
	}

	@Override
	public Filter getFilter() {
		return new Filter() {

			@Override
			protected void publishResults(CharSequence constraint,
					FilterResults results) {

				// Now we have to inform the adapter about the new list filtered
				if (results.count == 0) {
					notifyDataSetInvalidated();
				} else {
					// data.clear();
					// data.addAll((ArrayList<HashMap<String,
					// String>>)results.values);
					data = (ArrayList<HashMap<String, String>>) results.values;
					notifyDataSetChanged();
				}
			}

			@Override
			protected FilterResults performFiltering(CharSequence constraint) {
				FilterResults results = new FilterResults();
				// We implement here the filter logic
				if (constraint == null || constraint.length() == 0) {
					// No filter implemented we return all the list
					results.values = tempData;
					results.count = tempData.size();
				} else {
					// We perform filtering operation
					ArrayList<HashMap<String, String>> s = data;
					ArrayList<HashMap<String, String>> nData = new ArrayList<HashMap<String, String>>();

					for (HashMap<String, String> p : s) {
						for (Entry<String, String> entry : p.entrySet()) {
							String key = entry.getKey();
							String value = entry.getValue();
							if (key.equals("title")
									&& value.toLowerCase().contains(constraint.toString().toLowerCase())) {
								nData.add(p);
								break;
							}
						}

					}

					results.values = nData;
					results.count = nData.size();

				}
				return results;
			}
		};
	}
}