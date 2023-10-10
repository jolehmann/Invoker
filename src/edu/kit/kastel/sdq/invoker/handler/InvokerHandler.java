package edu.kit.kastel.sdq.invoker.handler;

import edu.kit.kastel.sdq.invoker.Invoker;
import java.util.List;
import java.util.ArrayList;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.core.commands.IHandler;
import org.eclipse.core.resources.IFile;
import org.eclipse.core.resources.IResource;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.ui.handlers.HandlerUtil;

public class InvokerHandler <T extends IResource> extends AbstractHandler implements IHandler {

	@Override
	public Object execute(ExecutionEvent event) throws ExecutionException {
		ISelection selection = HandlerUtil.getCurrentSelection(event);
		List<IFile> filteredSelection = filterSelection(selection);
		Invoker invoker = new Invoker();
		invoker.invoke(filteredSelection, event, getPlugInID());
		// TODO Auto-generated method stub
		return null;
	}
	
	public String getPlugInID() {
	    return "edu.kit.kastel.sdq.invoker";
	  }
	
	List<IFile> filterSelection(ISelection selection) {
		ArrayList<IFile> files = new ArrayList<IFile>();
		if (selection instanceof IStructuredSelection) {
			IStructuredSelection structuredSelection = (IStructuredSelection)selection;
			for (Object o : structuredSelection) {
				if (o instanceof IFile) {
					files.add((IFile) o);
				}
			}
		}
		return files;
	}

}
