package com.mxssh;

import java.io.IOException;
import java.net.SocketException;
import java.util.logging.Logger;

import com.jcraft.jsch.JSchException;

public class Task extends SSHTask {

	private static Logger logger = Logger.getLogger("");	

	public Task(){	}
	
	public Task(String serverName, String username, String password) {
		super(serverName,username,password);
	}

	public String sessionExec(String command) throws IOException, SSHMXException, InterruptedException {
		if (!this.getSSHService().isConnected()) {
			throw new SSHMXException();
		}

		return this.getSSHService().executeCommand(command);
	}

	public String channelExec(String command) throws IOException,InterruptedException, JSchException {
		if ( !this.getSSHService().isConnected()) {
			throw new InterruptedException();
		}

		return this.getSSHService().channelExec(command);
	}

	public void printWrite(String command) {
		this.getSSHService().printWrite(command);
	}

	public String remoteExecShellScript(String command) throws IOException,
			InterruptedException {
		if ( !isConnected()) {
			throw new InterruptedException();
		}

		return this.getSSHService().printWriteln(command);
	}

	public void dowload(String sourceDir, String sourceFile, String destDir) throws SSHMXException, InterruptedException {
		SSHService ssh = getSSHService();
		boolean isNew = false;
		try {
			if (ssh == null) {
				ssh = new SSHService();
				isNew = true;
				ssh.connect(getServerName(), getUsername(), getPassword());
			}
			SCPClient scp = new SCPClient();
			scp.getFile(ssh, sourceDir, sourceFile, destDir);
		} catch (SocketException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (JSchException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} finally {
			if (isNew && ssh != null && ssh.isConnected())
				ssh.disconnect();
		}
	}

	public void download(String username, String password, String sourceDir,	String sourceFile, String destDir) throws SSHMXException, InterruptedException {
		SSHService ssh = new SSHService();
		try {
			ssh.connect(getServerName(), username, password);
			SCPClient scp = new SCPClient();
			scp.getFile(ssh, sourceDir, sourceFile, destDir);
		} catch (SocketException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (JSchException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} finally {
			if (ssh != null && ssh.isConnected())
				ssh.disconnect();
		}
	}

	public void download(String hostname, String username, String password,	String sourceDir, String sourceFile, String destDir)
			throws SSHMXException, InterruptedException {
		SSHService ssh = new SSHService();
		try {
			ssh.connect(hostname, username, password);
			SCPClient scp = new SCPClient();
			scp.getFile(ssh, sourceDir, sourceFile, destDir);
		} catch (SocketException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (JSchException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} finally {
			if (ssh != null && ssh.isConnected())
				ssh.disconnect();
		}
	}

	public void upload(String sourceFile, String destFile)
			throws SSHMXException, InterruptedException {
		SSHService ssh = getSSHService();
		boolean isNew = false;
		try {
			if (ssh == null) {
				ssh = new SSHService();
				isNew = true;
				ssh.connect(getServerName(), getUsername(), getPassword());
			}

			SCPClient scp = new SCPClient();
			scp.sendFile(ssh, sourceFile, destFile);
		} catch (SocketException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (JSchException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} finally {
			if (isNew && ssh != null && ssh.isConnected())
				ssh.disconnect();
		}
	}

	public void upload(String username, String password, String sourceFile,
			String destFile) throws SSHMXException, InterruptedException {
		SSHService ssh = new SSHService();
		try {
			ssh.connect(getServerName(), username, password);
			SCPClient scp = new SCPClient();
			scp.sendFile(ssh, sourceFile, destFile);
		} catch (SocketException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (JSchException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} finally {
			if (ssh != null && ssh.isConnected())
				ssh.disconnect();
		}
	}

	public void upload(String hostname, String username, String password,
			String sourceFile, String destFile) throws SSHMXException, InterruptedException {
		SSHService ssh = new SSHService();
		try {
			ssh.connect(hostname, username, password);
			SCPClient scp = new SCPClient();
			scp.sendFile(ssh, sourceFile, destFile);
		} catch (SocketException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} catch (JSchException e) {
			logger.severe(e.getMessage());
			e.printStackTrace();
		} finally {
			if (ssh != null && ssh.isConnected())
				ssh.disconnect();
		}
	}

	public void sudo(String userID) throws CannotSudoException,
			IOException, InterruptedException, SSHMXException {
		String cmd = null;
		cmd = "sudo su - " + userID + "\n";
		sessionExec(cmd);
		sessionExec("export PS1='mxssh>'");
		sessionExec("set -o vi");
		sessionExec("umask 002");
	}

	public void sudo() throws CannotSudoException,	IOException, InterruptedException, SSHMXException {
		String cmd = null;
		cmd = "sudo su - \n";
		sessionExec(cmd);
		sessionExec("export PS1='mxssh>'");
		sessionExec("set -o vi");
		sessionExec("umask 002");
	}


}
