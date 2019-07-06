package com.mxssh;

import java.util.logging.Logger;

import org.python.core.PyString;
import org.python.core.PySystemState;
import org.python.util.PythonInterpreter;


public class JythonScript {

	private static Logger logger = Logger.getLogger("");	
	private static String SCRIPT_PATH;
	public static String MXSSH_HOME;
	private static PySystemState state = new PySystemState();
	
	
	public static void main(String args[]){
		JythonScript.MXSSH_HOME = System.getProperty("mxssh.path");
		logger.fine("Iniciar Log4j");
		
		JythonScript.SCRIPT_PATH = args[0];
		logger.fine("args[0]= "+args[0]);
		
		for(int i=1; i < args.length; i++){
			state.argv.append (new PyString(args[i]));
			logger.fine("args["+i+"]= "+args[i]);
		}
		
		//logger.debug(MXSSH_HOME+"/lib");
		//state.path.append(new PyString(MXSSH_HOME+"/lib"));
		JythonScript jython = new JythonScript();
		jython.execute();
	}
	
	public void execute() {
		
		PythonInterpreter.initialize(System.getProperties(), System.getProperties(), new String[0]);
		PythonInterpreter pi = new PythonInterpreter(null, state);
		pi.set("logger", logger);
		pi.set("task", this);
		
		
		logger.fine("interpreter created");
		pi.execfile(JythonScript.SCRIPT_PATH);
		pi.close();
	}
	
}
