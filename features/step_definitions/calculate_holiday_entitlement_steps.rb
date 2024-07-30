Given('I navigate to the homepage') do 
    visit 'https://www.gov.uk/calculate-your-holiday-entitlement'
    sleep 1
end


And('I should see the homepage') do
    check_standard_footer
    expect(page).to have_title 'Calculate holiday entitlement - GOV.UK'
    expect(page).to have_css 'h1.govuk-heading-xl'
    expect(page).to have_link 'Start now'
    expect(page).to have_content 'Use this tool to calculate holiday entitlement for:'
    expect(page).to have_content 'a full leave year'
    expect(page).to have_content 'part of a leave year, if the job started or finished part way through the year'
    expect(page).to have_content 'If an employee works irregular hours or for part of the year, you also use this calculator to work out how much leave they’ve built up (‘accrued’) over a pay period.'
    expect(page).to have_content 'Explore the topic'
    expect(page).to have_link 'Statutory leave and time off'
    expect(page).to have_link 'Holidays, time off, sick leave, maternity and paternity leave'
end

When ("I click on the 'Start now' button") do
    click_link('Start now')
    @answers = Hash.new
    @answers_irregular = Hash.new
end

And ('I select the option {string} for {string}') do |input, question|
    check_standard_footer
    expect(page).to have_title "#{question} - Calculate holiday entitlement - GOV.UK"
    choose(input, allow_label_click: true)
    find_button('Continue').click
    @answers[question] = input
end

And ('I input {float} for {string}') do |input, question|
    check_standard_footer
    expect(page).to have_title "#{question} - Calculate holiday entitlement - GOV.UK"
    fill_in("response",	with: input)
    click_button('Continue')
    @answers[question] = input
end


And ('I input {int} of {int} {int} for {string}') do |day, month, year, question|
  check_standard_footer
  expect(page).to have_title "#{question} - Calculate holiday entitlement - GOV.UK"
  fill_in('response-0', with: day)
  fill_in('response-1', with: month)
  fill_in('response-2', with: year)
  click_button('Continue')
  @answers_irregular[question] = day
  @answers_irregular[question] = month
  @answers_irregular[question] = year
end

Then ('I should see the correct submitted answers') do
    check_standard_footer
    expect(page).to have_title 'Outcome - Calculate holiday entitlement - GOV.UK'
    @answers.each do |question, input|
    expect(page).to have_css('dt', class: 'govuk-summary-list__key', text: question)
    expect(page).to have_css('dd', class: 'govuk-summary-list__value', text: input)
    end

    @answers_irregular.each do |question, input|
    expect(page).to have_css('dt', class: 'govuk-summary-list__key', text: question)
    expect(page).to have_css('dd', class: 'govuk-summary-list__value', text: input)
    end
end



And ('I should see the total entitlement hours') do
  expect(page).to have_text("The statutory")
end

