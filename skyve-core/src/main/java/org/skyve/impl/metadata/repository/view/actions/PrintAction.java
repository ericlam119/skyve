package org.skyve.impl.metadata.repository.view.actions;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlType;

import org.skyve.impl.util.XMLMetaData;
import org.skyve.metadata.controller.ImplicitActionName;

@XmlType(namespace = XMLMetaData.VIEW_NAMESPACE)
@XmlRootElement(namespace = XMLMetaData.VIEW_NAMESPACE, name = "print")
public class PrintAction extends ValidatableAction {
	private static final long serialVersionUID = -9047041543026042235L;

	public PrintAction() {
		implicitName = ImplicitActionName.Print;
	}
}
