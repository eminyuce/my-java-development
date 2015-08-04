import java.io.IOException;
import java.io.InputStream;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

public class CLICommand {

	public String send(Session session, String command) throws IOException,
			JSchException {
		return this.send(session, command, command);
	}

	public String send(Session session, String commandName, String command)
			throws IOException, JSchException {
		StringBuilder builder = new StringBuilder();

		Channel channel = session.openChannel("exec");
		((ChannelExec) channel).setCommand(command);

		// X Forwarding
		// channel.setXForwarding(true);

		// channel.setInputStream(System.in);
		channel.setInputStream(null);

		// channel.setOutputStream(System.out);

		// FileOutputStream fos=new FileOutputStream("/tmp/stderr");
		// ((ChannelExec)channel).setErrStream(fos);
		((ChannelExec) channel).setErrStream(System.err);

		InputStream in = channel.getInputStream();

		channel.connect();
		byte[] tmp = new byte[1024];
		while (true) {
			while (in.available() > 0) {
				int i = in.read(tmp, 0, 1024);
				if (i < 0)
					break;
				builder.append(new String(tmp, 0, i));
			}
			if (channel.isClosed()) {
				System.out.println("exit-status: " + channel.getExitStatus());
				break;
			}
			try {
				Thread.sleep(1000);
			} catch (Exception ee) {
			}
		}
		channel.disconnect();

		return builder.toString();
	}
}
