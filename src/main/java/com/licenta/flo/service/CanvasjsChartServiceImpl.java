package com.licenta.flo.service;
 
import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;

import com.licenta.flo.daos.CanvasjsChartDao;
import com.licenta.flo.model.CanvasjsChartData;
import com.licenta.flo.model.CanvasjsChartData.DataPointModel;
 
public class CanvasjsChartServiceImpl implements CanvasjsChartService {
 
	@Autowired
	private CanvasjsChartDao canvasjsChartDao;
 
	public void setCanvasjsChartDao(CanvasjsChartDao canvasjsChartDao) {
		this.canvasjsChartDao = canvasjsChartDao;
	}
 
	@Override
	public List<List<DataPointModel>> getCanvasjsChartData() {
		return canvasjsChartDao.getCanvasjsChartData();
	}
 
}                        