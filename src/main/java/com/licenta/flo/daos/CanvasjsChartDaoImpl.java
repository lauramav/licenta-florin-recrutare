package com.licenta.flo.daos;

import java.util.List;

import com.licenta.flo.model.CanvasjsChartData;
import com.licenta.flo.model.CanvasjsChartData.DataPointModel;

public class CanvasjsChartDaoImpl implements CanvasjsChartDao {

	@Override
	public List<List<DataPointModel>> getCanvasjsChartData() {
		return CanvasjsChartData.getCanvasjsDataList();
	}

}