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
end

And("I select the option no for working irregular hours") do
    check_standard_footer
    choice('No', allow_label_click: true)
    click_button('')
end

And ('I select the option hours worked per week') do
    check_standard_footer
    choose("hours worked per week")
    click_button('Continue')
end

And ('I select the option for a full leave year') do
    click_on('for a full leave year')
    click_button('Continue')
end

And ('I input 37.5 hours worked per week') do
    fill_in("id#response",	with: "37.5" )
    click_button('Continue')
end

And ('I input 5 days worked per week') do
    fill_in("id#response",	with: "5" )
    click_button('Continue')
end

Then ('I should see the correct submitted answers') do
    expect(page).to have_css('dt#govuk-summary-list__key', :text => 'Does the employee work irregular hours or for part of the year?')
    expect(page).to have_css('dt#govuk-summary-list__key', :text => 'Is the holiday entitlement based on:')
    expect(page).to have_css('dt#govuk-summary-list__key', :text => 'Do you want to work out holiday:')
    expect(page).to have_css('dt#govuk-summary-list__key', :text => 'Number of hours worked per week?')
    expect(page).to have_css('dt#govuk-summary-list__key', :text => 'Number of days worked per week?')

    expect(page).to have_css('dt#govuk-summary-list__value', :text => 'No')
    expect(page).to have_css('dt#govuk-summary-list__key', :text => 'hours worked per week')
    expect(page).to have_css('dt#govuk-summary-list__key', :text => 'for a full leave year	')
    expect(page).to have_css('dt#govuk-summary-list__key', :text => '37.5')
    expect(page).to have_css('dt#govuk-summary-list__key', :text => 'Does the employee work irregular hours or for part of the year?')


end

And ('I should see the total entitlement hours') do
    
end