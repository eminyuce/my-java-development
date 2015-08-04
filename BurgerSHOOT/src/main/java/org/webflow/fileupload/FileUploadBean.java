package org.webflow.fileupload;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;

import org.richfaces.event.UploadEvent;
import org.richfaces.model.UploadItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.webflow.service.UserService;

@Component("fileUploadBean")
@Scope("session")
public class FileUploadBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private UploadFile file;
	private byte[] anonymUserImageData;
	private String nullPlaceHolder = null;

	public FileUploadBean() {
		System.out.println("New File Upload Bena isntance!!!");
		try {
			InputStream inputStream = getClass().getResourceAsStream(
					"/images/anonym_user.png");

			anonymUserImageData = new byte[inputStream.available()];
			inputStream.read(anonymUserImageData);
			file = new UploadFile();
			file.setData(anonymUserImageData);
			file.setLength(anonymUserImageData.length);
			file.setName("/images/anonym_user.png");

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void paint(OutputStream stream, Object object) throws IOException {
		System.out.println("Paint called!");

		byte[] data = null;
//		if (file == null) {
//			data = anonymUserImageData;
//			System.out.println("Default image is used");
//		} else {
//			UploadFile uploadFile = file;
//			data = uploadFile.getData();
//			System.out.println("Uploaded image used");
//		}
		data = file.getData();
		stream.write(data);
	}

	public void listener(UploadEvent event) throws Exception {
		UploadItem uploadItem = event.getUploadItem();

		UploadFile file = new UploadFile();
		file.setData(uploadItem.getData());
		file.setLength(uploadItem.getData().length);
		file.setName(uploadItem.getFileName());
		this.setFile(file);
		System.out.println("Listener called successfully!");
	}

	public void setFile(UploadFile file) {
		this.file = file;
	}

	public UploadFile getFile() {
		return file;
	}

	public void setNullPlaceHolder(String nullPlaceHolder) {
		this.nullPlaceHolder = nullPlaceHolder;
	}

	public String getNullPlaceHolder() {
		return nullPlaceHolder;
	}
}
