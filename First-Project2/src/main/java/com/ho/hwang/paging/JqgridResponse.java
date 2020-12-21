package com.ho.hwang.paging;

import com.ho.hwang.vo.EmployeeVo;

import java.util.List;

public class JqgridResponse<T> {

    private int page;

    /**
     * Total pages for the query
     */
    private int total;

    /**
     * Total number of records for the query
     */
    private int records;

    /**
     * An array that contains the actual objects
     */
    private List<T> rows;


    public JqgridResponse() {
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getRecords() {
        return records;
    }

    public void setRecords(int records) {
        this.records = records;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

}
