package com.mxssh;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

public class SCPClient {
	protected Channel channel = null;

	public File getFile(SSHService ssh, String sourceDir, String sourceFile) {
		File ffile = null;
		try {
			ffile = File.createTempFile("MyFile.txt", ".tmp" );
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		FileOutputStream fos = null;
		try {
			// exec 'scp -f rfile' remotely
			
			String command = "scp -f " + sourceDir +"/"+ sourceFile;
			if( sourceDir.endsWith("/") ){
				command = "scp -f " + sourceDir + sourceFile;
			}
			
			channel = ssh.getSshSession().openChannel("exec");
			((ChannelExec) channel).setCommand(command);

			// get I/O streams for remote scp
			OutputStream out = channel.getOutputStream();
			InputStream in = channel.getInputStream();

			channel.connect();

			byte[] buf = new byte[1024];

			// send '\0'
			buf[0] = 0;
			out.write(buf, 0, 1);
			out.flush();

			while (true) {
				int c = checkAck(in);
				if (c != 'C') {
					break;
				}

				// read '0644 '
				in.read(buf, 0, 5);

				long filesize = 0L;
				while (true) {
					if (in.read(buf, 0, 1) < 0) {
						// error
						break;
					}
					if (buf[0] == ' ')
						break;
					filesize = filesize * 10L + (long) (buf[0] - '0');
				}

				String file = null;
				for (int i = 0;; i++) {
					in.read(buf, i, 1);
					if (buf[i] == (byte) 0x0a) {
						file = new String(buf, 0, i);
						break;
					}
				}

				// System.out.println("filesize="+filesize+", file="+file);

				// send '\0'
				buf[0] = 0;
				out.write(buf, 0, 1);
				out.flush();

				// read a content of lfile
				fos = new FileOutputStream(ffile);
				int foo;
				while (true) {
					if (buf.length < filesize)
						foo = buf.length;
					else
						foo = (int) filesize;
					foo = in.read(buf, 0, foo);
					if (foo < 0) {
						// error
						break;
					}
					fos.write(buf, 0, foo);
					filesize -= foo;
					if (filesize == 0L)
						break;
				}
				fos.close();
				fos = null;

				if (checkAck(in) != 0) {
					System.exit(0);
				}

				// send '\0'
				buf[0] = 0;
				out.write(buf, 0, 1);
				out.flush();
			}
		} catch (Exception e) {
			System.out.println(e);
			try {
				if (fos != null)
					fos.close();
			} catch (Exception ee) {
			}
		} finally {
			  if ( channel!=null && channel.isConnected() ){
				   channel.disconnect();
				   channel = null;
			  }			
		}
		return ffile;
	}
		
	public void getFile(SSHService ssh, String sourceDir, String sourceFile,
			String destDir) {
		String lfile = destDir + "/"+sourceFile;
		if( destDir.endsWith("/") ){
			lfile = destDir +sourceFile;
		}
		

		File destDirf = new File(destDir);
		if(!destDirf.exists()){
			destDirf.mkdir();
		}
		
		FileOutputStream fos = null;
		try {

			String prefix = null;
			if (new File(lfile).isDirectory()) {
				prefix = lfile + File.separator;
			}

			Session session = ssh.getSshSession();

			// exec 'scp -f rfile' remotely
			
			String command = "scp -f " + sourceDir +"/"+ sourceFile;
			if( sourceDir.endsWith("/")){
				command = "scp -f " + sourceDir + sourceFile;
			}
			channel = session.openChannel("exec");
			((ChannelExec) channel).setCommand(command);

			// get I/O streams for remote scp
			OutputStream out = channel.getOutputStream();
			InputStream in = channel.getInputStream();

			channel.connect();

			byte[] buf = new byte[1024];

			// send '\0'
			buf[0] = 0;
			out.write(buf, 0, 1);
			out.flush();

			while (true) {
				int c = checkAck(in);
				if (c != 'C') {
					break;
				}

				// read '0644 '
				in.read(buf, 0, 5);

				long filesize = 0L;
				while (true) {
					if (in.read(buf, 0, 1) < 0) {
						// error
						break;
					}
					if (buf[0] == ' ')
						break;
					filesize = filesize * 10L + (long) (buf[0] - '0');
				}

				String file = null;
				for (int i = 0;; i++) {
					in.read(buf, i, 1);
					if (buf[i] == (byte) 0x0a) {
						file = new String(buf, 0, i);
						break;
					}
				}

				// System.out.println("filesize="+filesize+", file="+file);

				// send '\0'
				buf[0] = 0;
				out.write(buf, 0, 1);
				out.flush();

				// read a content of lfile
				fos = new FileOutputStream(prefix == null ? lfile : prefix
						+ file);
				int foo;
				while (true) {
					if (buf.length < filesize)
						foo = buf.length;
					else
						foo = (int) filesize;
					foo = in.read(buf, 0, foo);
					if (foo < 0) {
						// error
						break;
					}
					fos.write(buf, 0, foo);
					filesize -= foo;
					if (filesize == 0L)
						break;
				}
				fos.close();
				fos = null;

				if (checkAck(in) != 0) {
					System.exit(0);
				}

				// send '\0'
				buf[0] = 0;
				out.write(buf, 0, 1);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			try {
				if (fos != null)
					fos.close();
			} catch (Exception ee) {
			}
		} finally {
			  if ( channel!=null && channel.isConnected() ){
				   channel.disconnect();
				   channel = null;
			  }			
		}

	}

	public void putFile(SSHService ssh, String sourceDir, String sourceFile,
			String destDir) {

		String lfile = destDir + "/"+sourceFile;
		if( destDir.endsWith("/") ){
			lfile = destDir +sourceFile;
		}

		File destDirf = new File(destDir);
		if(!destDirf.exists()){
			destDirf.mkdir();
		}
		
		FileOutputStream fos = null;
		try {

			String prefix = null;
			if (new File(lfile).isDirectory()) {
				prefix = lfile + File.separator;
			}

			Session session = ssh.getSshSession();

			// exec 'scp -f rfile' remotely
			String command = "scp -p -t " + sourceDir +"/"+ sourceFile;
			if( sourceDir.endsWith("/")){
				command = "scp -p -t " + sourceDir + sourceFile;
			}			
			channel = session.openChannel("exec");
			((ChannelExec) channel).setCommand(command);

			// get I/O streams for remote scp
			OutputStream out = channel.getOutputStream();
			InputStream in = channel.getInputStream();

			channel.connect();

			byte[] buf = new byte[1024];

			// send '\0'
			buf[0] = 0;
			out.write(buf, 0, 1);
			out.flush();

			while (true) {
				int c = checkAck(in);
				if (c != 'C') {
					break;
				}

				// read '0644 '
				in.read(buf, 0, 5);

				long filesize = 0L;
				while (true) {
					if (in.read(buf, 0, 1) < 0) {
						// error
						break;
					}
					if (buf[0] == ' ')
						break;
					filesize = filesize * 10L + (long) (buf[0] - '0');
				}

				String file = null;
				for (int i = 0;; i++) {
					in.read(buf, i, 1);
					if (buf[i] == (byte) 0x0a) {
						file = new String(buf, 0, i);
						break;
					}
				}

				// System.out.println("filesize="+filesize+", file="+file);

				// send '\0'
				buf[0] = 0;
				out.write(buf, 0, 1);
				out.flush();

				// read a content of lfile
				fos = new FileOutputStream(prefix == null ? lfile : prefix
						+ file);
				int foo;
				while (true) {
					if (buf.length < filesize)
						foo = buf.length;
					else
						foo = (int) filesize;
					foo = in.read(buf, 0, foo);
					if (foo < 0) {
						// error
						break;
					}
					fos.write(buf, 0, foo);
					filesize -= foo;
					if (filesize == 0L)
						break;
				}
				fos.close();
				fos = null;

				if (checkAck(in) != 0) {
					System.exit(0);
				}

				// send '\0'
				buf[0] = 0;
				out.write(buf, 0, 1);
				out.flush();
			}
		} catch (Exception e) {
			System.out.println(e);
			try {
				if (fos != null)
					fos.close();
			} catch (Exception ee) {
			}
		} finally {
			  if ( channel!=null && channel.isConnected() ){
				   channel.disconnect();
				   channel = null;
			  }			
		}
	}
	
	private static int checkAck(InputStream in) throws IOException {
		int b = in.read();
		// b may be 0 for success,
		// 1 for error,
		// 2 for fatal error,
		// -1
		if (b == 0)
			return b;
		if (b == -1)
			return b;

		if (b == 1 || b == 2) {
			StringBuffer sb = new StringBuffer();
			int c;
			do {
				c = in.read();
				sb.append((char) c);
			} while (c != '\n');
			if (b == 1) { // error
				System.out.print(sb.toString());
			}
			if (b == 2) { // fatal error
				System.out.print(sb.toString());
			}
		}
		return b;
	}

	public boolean sendFile(SSHService ssh, String sourceFilename, String destFilename) {
		FileInputStream fis = null;

		try {
			String command = "scp -p -t " + destFilename;
			Channel channel = ssh.getSshSession().openChannel("exec");
			((ChannelExec) channel).setCommand(command);
	
			OutputStream out = channel.getOutputStream();
			InputStream in = channel.getInputStream();
	
			channel.connect();
	
	//		send "C0644 filesize filename" where filename doesn't contain a /
			long filesize = (new File(sourceFilename)).length();
			command = "C0644 " + filesize + " ";
			if (sourceFilename.lastIndexOf('/') > 0) {
				command += sourceFilename.substring(sourceFilename.lastIndexOf('/') + 1);
			} else {
				command += sourceFilename;
			}
			command += "\n";
	
			out.write(command.getBytes());
			out.flush();
	
	//		send the contents of the source file
			fis = new FileInputStream(sourceFilename);
			byte[] buf = new byte[1024];
			while (true) {
			int len = fis.read(buf, 0, buf.length);
	
			if (len <= 0) {
			break;
			}
	
			out.write(buf, 0, len);
			}
	
			fis.close();
			fis = null;
	
			buf[0] = 0;
			out.write(buf, 0, 1);
			out.flush();
	
			out.close();
		
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				if (fis != null) {
				fis.close();
				}
			} catch (Exception ee) {
				ee.printStackTrace();
			}
		} finally {
			  if ( channel!=null && channel.isConnected() ){
				   channel.disconnect();
				   channel = null;
			  }			
		}

		return false;
		}

	
	public static void main(String args[]) throws SocketException, IOException, JSchException, InterruptedException, SSHMXException{
		SSHService ssh = new SSHService();
		ssh.connect("localhost", "fsbsilva", "1234");
		SCPClient scp = new SCPClient();
		scp.sendFile(ssh, "C:/scripts/201103_SSL/access_denied.txt", "/tmp/fsbsilva/access_denied.txt");
		ssh.disconnect();
	}
}
