<?php

namespace App\DataTables\Admin;

use App\Contract;
use App\DataTables\BaseDataTable;
use App\ProjectTimeLog;
use App\Task;
use App\TaskboardColumn;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;

class AllTimeLogsDataTable extends BaseDataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    protected $timeLogFor;
    protected $isTask;
    public function __construct()
    {
        parent::__construct();
    }

    public function dataTable($query)
    {
        return datatables()
            ->eloquent($query)
            ->addColumn('action', function ($row) {
                $action = '<div class="btn-group dropdown m-r-10">
                <button aria-expanded="false" data-toggle="dropdown" class="btn dropdown-toggle waves-effect waves-light" type="button"><i class="ti-more"></i></button>
                <ul role="menu" class="dropdown-menu pull-right">
                <li><a href="javascript:;" class="edit-time-log"
                data-toggle="tooltip" data-time-id="' . $row->id . '"  data-original-title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i> ' . trans('app.edit') . '</a></li>
                <li> <a href="javascript:;" class="sa-params"
                data-toggle="tooltip" data-time-id="' . $row->id . '" data-original-title="Delete"><i class="fa fa-times" aria-hidden="true"></i> ' . trans('app.delete') . '</a></li>';

                if (!$row->approved) {
                    $action.= '<li> <a href="javascript:;" class="approve-timelog"
                    data-time-id="' . $row->id . '"><i class="fa fa-check" aria-hidden="true"></i> ' . trans('app.approve') . '</a></li>';
                }

                $action .= '</ul> </div>';
                return $action;
            })
            ->editColumn('name', function ($row) {
                return '<a href="' . route('admin.employees.show', $row->user_id) . '" target="_blank" >' . ucwords($row->name) . '</a>';
            })
            ->editColumn('start_time', function ($row) {
                return $row->start_time->timezone($this->global->timezone)->format($this->global->date_format . ' ' . $this->global->time_format);
            })
            ->editColumn('end_time', function ($row) {
                if (!is_null($row->end_time)) {
                    return $row->end_time->timezone($this->global->timezone)->format($this->global->date_format . ' ' . $this->global->time_format);
                } else {
                    return "<label class='label label-success'>" . __('app.active') . "</label>";
                }
            })
            ->editColumn('total_hours', function ($row) {
                $timeLog = intdiv($row->total_minutes, 60) . ' ' . __('app.hrs') . ' ';

                if (($row->total_minutes % 60) > 0) {
                    $timeLog .= ($row->total_minutes % 60) . ' ' . __('app.mins');
                }

                if ($row->approved) {
                    $timeLog.= ' <i data-toggle="tooltip" data-original-title="' . __('app.approved') . '" class="fa fa-check-circle text-success"></i>';
                } else {
                    $timeLog.= ' <i data-toggle="tooltip" data-original-title="' . __('app.pending') . '" class="fa fa-check-circle text-muted" ></i>';
                }

                return $timeLog;
            })
            ->editColumn('earnings', function ($row) {
                if (is_null($row->hourly_rate)) {
                    return '--';
                }

                return $this->global->currency->currency_symbol . $row->earnings . ' (' . $this->global->currency->currency_code . ')';
            })
            ->editColumn('project_name', function ($row) {
                $name = '';
                if (!is_null($row->project_id) && !is_null($row->task_id)) {
                    $name.= '<span class="font-semi-bold">' . $row->task->heading . '</span><br><span class="text-muted">' . $row->project->project_name . '</span>';
                } else if (!is_null($row->project_id)) {
                    $name.= '<span class="font-semi-bold">' . $row->project->project_name . '</span>';
                } else if (!is_null($row->task_id)) {
                    $name.= '<span class="font-semi-bold">' . $row->task->heading . '</span>';
                }
                
                return $name;
            })
            ->addIndexColumn()
            ->rawColumns(['end_time', 'action', 'project_name', 'name', 'total_hours'])
            ->removeColumn('project_id')
            ->removeColumn('total_minutes')
            ->removeColumn('task_id');
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Product $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(ProjectTimeLog $model)
    {
        $request = $this->request();

        $startDate = Carbon::createFromFormat($this->global->date_format, $request->startDate)->toDateString();
        $endDate = Carbon::createFromFormat($this->global->date_format, $request->endDate)->toDateString();
        $projectId = $request->projectId;
        $employee = $request->employee;
        $taskId = $request->taskId;
        $approved = $request->approved;

        $model = $model->with('user', 'project', 'task');

        $model = $model->join('users', 'users.id', '=', 'project_time_logs.user_id')
            ->join('employee_details', 'users.id', '=', 'employee_details.user_id')
            ->leftJoin('tasks', 'tasks.id', '=', 'project_time_logs.task_id')
            ->leftJoin('projects', 'projects.id', '=', 'project_time_logs.project_id');

        $model = $model->select('project_time_logs.id', 'project_time_logs.start_time', 'project_time_logs.end_time', 'project_time_logs.total_hours', 'project_time_logs.total_minutes', 'project_time_logs.memo', 'project_time_logs.user_id', 'project_time_logs.project_id', 'project_time_logs.task_id', 'users.name', 'project_time_logs.hourly_rate', 'project_time_logs.earnings', 'project_time_logs.approved');


        if (!is_null($startDate)) {
            $model->where(DB::raw('DATE(project_time_logs.`start_time`)'), '>=', $startDate);
        }

        if (!is_null($endDate)) {
            $model->where(DB::raw('DATE(project_time_logs.`end_time`)'), '<=', $endDate);
        }

        if (!is_null($employee) && $employee !== 'all') {
            $model->where('project_time_logs.user_id', $employee);
        }

        if (!is_null($projectId) && $projectId !== 'all') {
            $model->where('project_time_logs.project_id', '=', $projectId);
        }

        if (!is_null($taskId) && $taskId !== 'all') {
            $model->where('project_time_logs.task_id', '=', $taskId);
        }

        if (!is_null($approved) && $approved !== 'all') {
            $model->where('project_time_logs.approved', '=', $approved);
        }

        $model->orderBy('project_time_logs.id', 'desc');

        return $model;
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
            ->setTableId('all-time-logs-table')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->dom("<'row'<'col-md-6'l><'col-md-6'Bf>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>")
            ->orderBy(0)
            ->destroy(true)
            ->responsive(true)
            ->serverSide(true)
            ->stateSave(true)
            ->processing(true)
            ->language(__("app.datatable"))
            ->buttons(
                Button::make(['extend' => 'export', 'buttons' => ['excel', 'csv']])
            )
            ->parameters([
                'initComplete' => 'function () {
                   window.LaravelDataTables["all-time-logs-table"].buttons().container()
                    .appendTo( ".bg-title .text-right")
                }',
                'fnDrawCallback' => 'function( oSettings ) {
                    $("body").tooltip({
                        selector: \'[data-toggle="tooltip"]\'
                    })
                }',
            ]);
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        return [
            __('app.id') => ['data' => 'id', 'name' => 'id', 'visible' => false],
            '#' => ['data' => 'DT_RowIndex', 'orderable' => false, 'searchable' => false],
            __('app.task') => ['data' => 'project_name', 'name' => 'tasks.heading'],
            __('app.menu.employees')  => ['data' => 'name', 'name' => 'users.name'],
            __('modules.timeLogs.startTime') => ['data' => 'start_time', 'name' => 'start_time'],
            __('modules.timeLogs.endTime') => ['data' => 'end_time', 'name' => 'end_time'],
            __('modules.timeLogs.totalHours') => ['data' => 'total_hours', 'name' => 'total_hours'],
            __('app.earnings') => ['data' => 'earnings', 'name' => 'earnings'],
            Column::computed('action')
                ->exportable(false)
                ->printable(false)
                ->orderable(false)
                ->searchable(false)
                ->width(150)
                ->addClass('text-center')
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'All_time_log_' . date('YmdHis');
    }

    public function pdf()
    {
        set_time_limit(0);
        if ('snappy' == config('datatables-buttons.pdf_generator', 'snappy')) {
            return $this->snappyPdf();
        }

        $pdf = app('dompdf.wrapper');
        $pdf->loadView('datatables::print', ['data' => $this->getDataForPrint()]);

        return $pdf->download($this->getFilename() . '.pdf');
    }
}
