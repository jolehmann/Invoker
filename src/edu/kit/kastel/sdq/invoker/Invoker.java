package edu.kit.kastel.sdq.invoker;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.resources.IFile;
//import org.eclipse.core.resources.IResource;
import org.eclipse.core.resources.IWorkspace;
import org.eclipse.core.resources.ResourcesPlugin;
//import org.eclipse.core.runtime.IAdapterManager;
import org.eclipse.core.runtime.Platform;
//import org.osgi.framework.Bundle;
//import edu.kit.kastel.sdq.invoker.handler.InvokerHandler;

import edu.kit.kastel.sdq.accesscontrolgenerator.handlers.AccessControlGeneratorHandler;

public class Invoker {
	public void invoke(List<IFile> filteredSelection, ExecutionEvent event, String plugInID) {
		if (filteredSelection.size() < 1) {
			System.out.println("Invoker was executed without a selection");
		} else {
			System.out.println("Invoker was executed with following selection: " + filteredSelection.get(0));
		}
		
		this.tryToInvokeACG(filteredSelection, event, plugInID);
	}
	
	public void tryToInvokeACG(List<IFile> filteredSelection, ExecutionEvent event, String plugInID) {
		
		// Platform running?
		System.out.println(Platform.isRunning());
		
		// Invoker Plugin
//		InvokerHandler<IResource> invHandler = new InvokerHandler<>();
//		String plugInIDInvoker = invHandler.getPlugInID();
//		Bundle invBundle = Platform.getBundle(plugInIDInvoker);
//		System.out.println(invBundle);
//		System.out.println(invBundle.getState());
//		BundleContext ctx =  FrameworkUtil.getBundle(Invoker.class).getBundleContext();
//		try {
//			invBundle.start();
//		} catch (BundleException e) {
//			e.printStackTrace();
//		}
		
		// ACG Plugin
		AccessControlGeneratorHandler aCGHandler = new AccessControlGeneratorHandler();
//		String plugInIDACG = aCGHandler.getPlugInID();
//		Bundle aCGBundle = Platform.getBundle(plugInIDACG);
//		System.out.println(aCGBundle);
//		System.out.println(aCGBundle.getState());
		
		IWorkspace workspace = ResourcesPlugin.getWorkspace();
		IFile file1 = (IFile) workspace.getRoot().findMember("Invoker/Augur/Augur.accesscontrolsystem");
		IFile file2 = (IFile) workspace.getRoot().findMember("Invoker/Augur/Market.smartcontractmodel");
		List<IFile> files = new ArrayList<IFile>();
		files.add(file1);
		files.add(file2);
		
		try {
			//aCGBundle.start();
			aCGHandler.executeEcore2TxtGenerator(files, event, plugInID);
			System.out.println("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
