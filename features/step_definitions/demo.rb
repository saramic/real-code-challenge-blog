When("{string} visits the main page") do |_string|
  visit("/")
end

When("follows {string}") do |string|
  click_on string
end

Then("she sees a {string} form") do |string|
  expect(page.find("h1").text).to eq string
end

When("she fills in the fields") do |table|
  table.transpose.hashes.each do |table_hash|
    focus_on(:main_page).form_fill(table_hash)
  end
end

When("she clicks {string}") do |string|
  focus_on(:main_page).form_action(string)
end

Then("{string} sees success message {string}") do |_person, message|
  wait_for { focus_on(:main_page).alert_text }.to eq message
end

Then("{string} sees the article with the content") do |_person, table|
  wait_for do
    focus_on(:main_page).key_value(
      page.find_all("p strong"),
      page.find_all(:xpath, "//p/strong/.."),
    )
  end.to eq table.transpose.hashes.first
end

When("she refreshes the page") do
  page.refresh
end

Then("{string} sees the following articles") do |_string, table|
  wait_for do
    focus_on(:main_page).key_value(
      page.find_all(:xpath, "//tr/td[1]"),
      page.find_all(:xpath, "//tr/td[2]"),
    )
  end.to eq table.transpose.hashes.first
end

When("{string} creates an {string}") do |_person, model, table|
  visit("/")
  click_on "New #{model}"
  table.transpose.hashes.each do |table_hash|
    focus_on(:main_page).form_fill(table_hash)
  end
  focus_on(:main_page).form_action("Create #{model}")
end

When("{string} comments {string}") do |person, comment|
  focus_on(:main_page).form_fill("Commenter" => person, "Body" => comment)
  focus_on(:main_page).form_action("Create Comment")
end

Then(
  "{string} sees comment {int} with content",
) do |_person, comment_number, table|
  wait_for do
    page
      .find_all("[data-testid^=\"comment-\"]")
      .map { |e| e["data-testid"] }
      .map do |comment_id|
      page.within("[data-testid=\"#{comment_id}\"]") do
        focus_on(:main_page).key_value(
          page.find_all("p strong"),
          page.find_all(:xpath, "./p/strong/.."),
        )
      end
    end.slice(comment_number - 1, 1)
  end.to eq(table.transpose.hashes)
end

Given("the blog server is running") do
  # sort out how to start the server
  # in a clean state
  # `pushd ../blog_implementation/ &&
  #  bundle exec rails runner 'Article.delete_all' || popd`
end
