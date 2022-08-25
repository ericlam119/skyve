package org.skyve.impl.web.faces.charts.config;

import java.io.IOException;

import jakarta.faces.context.FacesContext;

import org.primefaces.model.charts.ChartModel;
import org.skyve.impl.sail.mock.MockFacesContext;

public class PolarAreaChartRenderer extends org.primefaces.component.polarareachart.PolarAreaChartRenderer {
	public String encodeConfig(ChartModel model) throws IOException {
		FacesContext fc = new MockFacesContext();
		try (ResponseWriter writer = new ResponseWriter()) {
			fc.setResponseWriter(writer);
			encodeConfig(fc, model);
			return ChartConfigRenderer.spruce(writer);
		}
	}
}
