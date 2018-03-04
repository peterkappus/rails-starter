namespace :statuses do
  desc "Tasks for pre-loading default status data."
  # Colors taken from here http://www.bbc.co.uk/gel/guidelines/how-to-design-infographics
  task seed: :environment do
    #Danger!
    Status.destroy_all

    #now create
    Status.create!([{
      name: "Not started",
      description: "We haven't started working on this, yet.",
      ordinal: 0,
      hex_color: '#566'
    },
    {
      name: "On track",
      description: "Confidence above 70%.",
      ordinal: 1,
      hex_color: '#5a8c3e'
    },
    {
      name: "At risk",
      description: "Confidence 40",
      ordinal: 3,
      hex_color: '#FC0'
    },
    {
      name: "In trouble",
      description: "Confidence below 40%",
      ordinal: 3,
      hex_color: '#9d1c1f'
    },
    {
      name: "Finished",
      description: "Done! Or at least, as done as it's going to get. No further work planned on this goal. Check narrative for final state and 'Lessons Learned'.",
      ordinal: 4,
      require_learnings: true,
      hex_color: '#4a777c'
    },
    {
      name: "Cancelled",
      description: "We've stopped work on this goal for some reason and don't plan to restart. Check narrative and lessons learned for detail.",
      ordinal: 5,
      require_learnings: true,
      hex_color: '#000'
    }])

    p "Created default statuses"

  end

end
