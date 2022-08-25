package org.skyve.impl.metadata.repository.view.actions;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlType;

import org.skyve.impl.util.XMLMetaData;
import org.skyve.metadata.controller.ImplicitActionName;

@XmlType(namespace = XMLMetaData.VIEW_NAMESPACE)
@XmlRootElement(namespace = XMLMetaData.VIEW_NAMESPACE, name = "add")
public class AddAction extends PositionableAction {
	private static final long serialVersionUID = 7167809540709304481L;

	public AddAction() {
		implicitName = ImplicitActionName.Add;
	}
}
