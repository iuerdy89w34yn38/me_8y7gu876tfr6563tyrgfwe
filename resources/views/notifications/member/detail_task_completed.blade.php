<div class="media">
    <div class="media-body">
        <h5 class="media-heading"><span class="btn btn-circle btn-success"><i class="fa fa-tasks"></i></span>{{ ucfirst($notification->data['heading']) }} - @lang('email.taskComplete.subject')</h5>
        </div>
    <h6><i>{{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $notification->created_at)->diffForHumans() }}</i></h6>
</div>
