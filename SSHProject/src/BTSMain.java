
import java.io.InputStream;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.UserInfo;

public class BTSMain {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		try {
			JSch jsch = new JSch();
			jsch.addIdentity("D:\\Project\\Adaptor\\calistigimAdaptorler\\BTS\\n+1_privatekey_id_rsa");
			String host = "gstool@135.112.240.5";

			String user = host.substring(0, host.indexOf('@'));
			host = host.substring(host.indexOf('@') + 1);

			Session session = jsch.getSession(user, host, 22);

			// username and passphrase will be given via UserInfo interface.
			UserInfo ui = new MyUserInfo();
			session.setUserInfo(ui);
			session.connect();

			String command = "uname -n";
			CLICommand cliCommand = new CLICommand();
			String cmdResponse = cliCommand.send(session, command);
			System.out.println(cmdResponse);
			
			
			command = "cat /etc/nsswitch.conf";
			cliCommand = new CLICommand();
			cmdResponse = cliCommand.send(session, command);
			System.out.println(cmdResponse);
			
			
			session.disconnect();
			System.out.println("Session is disconnect");
		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
