package org.skyve.impl.web.faces.converters.geometry;

import jakarta.faces.application.FacesMessage;
import jakarta.faces.component.UIComponent;
import jakarta.faces.context.FacesContext;
import jakarta.faces.convert.Converter;
import jakarta.faces.convert.ConverterException;

import org.locationtech.jts.geom.Geometry;
import org.skyve.domain.messages.ConversionException;
import org.skyve.impl.util.UtilImpl;

public class GeometryConverter extends org.skyve.domain.types.converters.geometry.GeometryConverter implements Converter {
	@Override
	public Object getAsObject(FacesContext fc, UIComponent component, String value) {
    	String processedValue = UtilImpl.processStringValue(value);
    	if (processedValue != null) {
			try {
				return fromDisplayValue(processedValue);
			}
			catch (ConversionException e) {
				String message = e.getMessages().get(0).getText();
				throw new ConverterException(new FacesMessage(FacesMessage.SEVERITY_ERROR, message, message), e);
			}
		}
		return null;
	}

	@Override
	public String getAsString(FacesContext fc, UIComponent component, Object value) {
		if (value == null) {
			return "";
		}
		try {
			return toDisplayValue((Geometry) value);
		}
		catch (@SuppressWarnings("unused") Exception e) {
			return "";
		}
	}
}
