package org.webflow.util;

import java.io.Serializable;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.ValidatorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.webflow.domain.User;
import org.webflow.fileupload.FileUploadBean;
import org.webflow.service.UserService;

public class UserBackingBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Autowired
	private transient UserService userService;

	private static String eula = "assssssssss assssssssssssssa asssssssssss asdasd"
			+ "asssssssssssssssssssssssssssssssssssssssssssssssssssss"
			+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa "
			+ "ssssssssssssssssssssssssssssssssssssssssssssssssssssss "
			+ "ddddddddddddddddddddddddddddddddddddddddddddddddddddd "
			+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa "
			+ "sssssssssssssssssssssssssssssssssssssssssssssssssssssss "
			+ "ssssssssssssssssssssssssssssssssssssssssssssssssssssssss "
			+ "sssssssssssssssssssssssssssssssssssssssssssssssssssssssss "
			+ "dsddddddddddddddddddddddddddddddddddddddddddddddddddddd";

	public UserBackingBean() {
	}


	public void validatePassword(FacesContext facesContext,
			UIComponent uiComponent, Object value) throws ValidatorException {
		String pass = (String) value;
		if (pass.length() < 5) {
			FacesMessage message = new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Password length must be at least 5!",
					"Password length must be at least 5!");
			throw new ValidatorException(message);
		}
	}

	public void validateName(FacesContext facesContext,
			UIComponent uiComponent, Object value) throws ValidatorException {
		String name = (String) value;
		User user = userService.findUser(name);

		if (name == null || name.length() == 0) {
			FacesMessage message = new FacesMessage(
					FacesMessage.SEVERITY_ERROR, "Name can not be empty!",
					"Name can not be empty!");
			throw new ValidatorException(message);
		}

		if (user != null) {
			FacesMessage message = new FacesMessage(
					FacesMessage.SEVERITY_ERROR,
					"Name already in use try another!",
					"Name already in use try another!");
			throw new ValidatorException(message);
		}
	}

	public void validateDOB(FacesContext facesContext, UIComponent uiComponent,
			Object value) throws ValidatorException {
		
	}

	public void validateEmail(FacesContext facesContext,
			UIComponent uiComponent, Object value) throws ValidatorException {
		
	}

	public String getEula() {
		return eula;
	}

}
