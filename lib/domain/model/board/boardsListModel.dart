class BoardsListModel {
  int? id;
  String? title;
  Creator? creator;
  List<TaskConditions>? taskConditions;
  String? createdAt;
  String? updateAt;

  BoardsListModel(
      {this.id,
      this.title,
      this.creator,
      this.taskConditions,
      this.createdAt,
      this.updateAt});

  BoardsListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    if (json['task_conditions'] != null) {
      taskConditions = <TaskConditions>[];
      json['task_conditions'].forEach((v) {
        taskConditions!.add(TaskConditions.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    if (taskConditions != null) {
      data['task_conditions'] = taskConditions!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['update_at'] = updateAt;
    return data;
  }
}

class Creator {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;

  Creator({this.id, this.firstName, this.lastName, this.phone});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    return data;
  }
}

class TaskConditions {
  int? id;
  String? title;
  CreatorTask? creatorTask;
  int? board;
  String? description;
  List<TaskItem>? taskItem;
  String? createdAt;
  String? updateAt;

  TaskConditions(
      {this.id,
      this.title,
      this.creatorTask,
      this.board,
      this.description,
      this.taskItem,
      this.createdAt,
      this.updateAt});

  TaskConditions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    creatorTask = json['creator_task'] != null
        ? CreatorTask.fromJson(json['creator_task'])
        : null;
    board = json['board'];
    description = json['description'];
    if (json['task_item'] != null) {
      taskItem = <TaskItem>[];
      json['task_item'].forEach((v) {
        taskItem!.add(TaskItem.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (creatorTask != null) {
      data['creator_task'] = creatorTask!.toJson();
    }
    data['board'] = board;
    data['description'] = description;
    if (taskItem != null) {
      data['task_item'] = taskItem!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['update_at'] = updateAt;
    return data;
  }
}

class CreatorTask {
  String? firstName;
  String? lastName;
  String? phone;

  CreatorTask({this.firstName, this.lastName, this.phone});

  CreatorTask.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    return data;
  }
}

class TaskItem {
  int? id;
  String? title;
  CreatorTask? creatorTaskItem;
  TaskCondition? taskCondition;
  List<SubTask>? subTask;
  String? createdAt;
  String? updateAt;

  TaskItem(
      {this.id,
      this.title,
      this.creatorTaskItem,
      this.taskCondition,
      this.subTask,
      this.createdAt,
      this.updateAt});

  TaskItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    creatorTaskItem = json['creator_task_item'] != null
        ? CreatorTask.fromJson(json['creator_task_item'])
        : null;
    taskCondition = json['task_condition'] != null
        ? TaskCondition.fromJson(json['task_condition'])
        : null;
    if (json['sub_task'] != null) {
      subTask = <SubTask>[];
      json['sub_task'].forEach((v) {
        subTask!.add(SubTask.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (creatorTaskItem != null) {
      data['creator_task_item'] = creatorTaskItem!.toJson();
    }
    if (taskCondition != null) {
      data['task_condition'] = taskCondition!.toJson();
    }
    if (subTask != null) {
      data['sub_task'] = subTask!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['update_at'] = updateAt;
    return data;
  }
}

class TaskCondition {
  String? title;
  String? creator;
  String? board;

  TaskCondition({this.title, this.creator, this.board});

  TaskCondition.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    creator = json['creator'];
    board = json['board'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['creator'] = creator;
    data['board'] = board;
    return data;
  }
}

class SubTask {
  int? id;
  String? title;
  int? taskItem;
  String? createdAt;
  String? updateAt;

  SubTask({this.id, this.title, this.taskItem, this.createdAt, this.updateAt});

  SubTask.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    taskItem = json['task_item'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['task_item'] = taskItem;
    data['created_at'] = createdAt;
    data['update_at'] = updateAt;
    return data;
  }
}
