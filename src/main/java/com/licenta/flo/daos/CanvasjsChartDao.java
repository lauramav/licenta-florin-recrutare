package com.licenta.flo.daos;

import java.util.List;

import com.licenta.flo.model.CanvasjsChartData.DataPointModel;

public interface CanvasjsChartDao {

	List<List<DataPointModel>> getCanvasjsChartData();

}
