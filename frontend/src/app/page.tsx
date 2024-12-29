'use client'

import { useQuery } from "@tanstack/react-query";

import apiRouter from '@/api/router'

export default function Home() {
  const { data } = useQuery({
    queryKey: ['getUsers'],
    queryFn: apiRouter.users.getUsers,
  })

  console.log(data)

  return (
    <main className="flex flex-col gap-8 row-start-2 items-center sm:items-start">
      <ul>
        {data?.map((user) => (
          <li key={user.id}>
            {user.name} - {user.email}
          </li>
        ))}
      </ul>
    </main>
  );
}
