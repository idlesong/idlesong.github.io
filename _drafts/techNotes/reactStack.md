```
subtitleOnChangeText={(text) => {
  console.tron.log(text)
  this.setState({subtitleValue: text})
  // console.tron.log(this.state.subtitleValue)

  const activityIndex = this.state.activityIndex
  console.tron.log('this.state.activityIndex')
  console.tron.log(activityIndex)

  // use ... to mute the array, then update the whole object, can't only 1 property
  let activities = [...this.state.activities]
  // activities.splice(activityIndex, 1, {activity_content: text})
  // let activities = [{activity_content: 'init activity0'}, {activity_content: 'init activity1'}]
  let activity = activities[activityIndex]
  // let activity2 = {...activity, activity_content: text}
  activities.splice(activityIndex, 1, {...activity, activity_content: text})
  // activities[activityIndex].activity_content = text
  // console.tron.log(activity2)
  // console.tron.log(activities[activityIndex].activity_content)
  // this.setState({activities: activities})
  console.tron.log(activities)
  // this.forceUpdate()
  // console.tron.log(this.state.activities)
}}
```
