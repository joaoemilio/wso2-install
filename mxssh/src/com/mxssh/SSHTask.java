package com.mxssh;

import java.io.IOException;
import java.net.SocketException;
import java.net.UnknownHostException;

import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.ProxySOCKS5;

public class SSHTask {
	
	private String serverName;
	private SSHService sshService;
	private int sessionTimeOut = 0;
	private int connectionTimeOut = 0;
	private String username;
	private String password;
	private ProxySOCKS5 proxySOCKS5=null;	

	public SSHTask(){ }
	
	public SSHTask(String serverName, String username, String password) {
		this.serverName = serverName;
		this.username = username;
		this.password = password;
	}
	
	public SSHService getSSHService(){
		return this.sshService;
	}

	public void connectPK( String serverName, String userName, String privateKeyPath ) {
		sshService = new SSHService();
		try {
			sshService.connect(serverName, userName, null, privateKeyPath);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SSHMXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void connect(String serverName, String username, String password) throws SocketException, IOException, JSchException, SSHMXException, InterruptedException {
		this.serverName = serverName;
		sshService = new SSHService();
		
		if( proxySOCKS5 != null ){
			sshService.setProxySOCKS5(proxySOCKS5);
		}
		
		if( sessionTimeOut > 0 ){
			sshService.setSessionTimeOut(sessionTimeOut);
		}
		if( connectionTimeOut > 0 ){
			sshService.setConnectionTimeOut(connectionTimeOut);
		}
		
		sshService.connect(serverName, username, password );
			
	}
	
	public void connect(String serverName) throws UnknownHostException,
		SocketException, IOException, JSchException, InterruptedException,
		SSHMXException {
		this.serverName = serverName;
		connect(serverName, getUsername(), getPassword());
	}
	
	public void connect() throws InterruptedException, SSHMXException, SocketException, IOException, JSchException{
		connect(serverName, getUsername(), getPassword() );
	}
	
	public void disconnect(){
		if( sshService!=null && sshService.isConnected() )
		    sshService.disconnect();
	}
	
	
	public boolean isConnected(){ 
		if(sshService==null){
			return false;
		}
		return sshService.isConnected();
	}
	
	public String getServerName() {
		return serverName;
	}
		
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}	
	
	public int getConnectionTimeOut() {
		return connectionTimeOut;
	}

	public void setConnectionTimeOut(int connectionTimeOut) {
		this.connectionTimeOut = connectionTimeOut;
	}

	public int getSessionTimeOut() {
		return sessionTimeOut;
	}

	public void setSessionTimeOut(int sessionTimeOut) {
		this.sessionTimeOut = sessionTimeOut;
	}

	public ProxySOCKS5 getProxySOCKS5() {
		return proxySOCKS5;
	}

	public void setProxySOCKS5(ProxySOCKS5 proxySOCKS5) {
		this.proxySOCKS5 = proxySOCKS5;
	}
	
	
	
}

